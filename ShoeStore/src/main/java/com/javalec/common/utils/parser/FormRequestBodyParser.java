package com.javalec.common.utils.parser;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Parameter;
import java.net.URLDecoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneOffset;
import java.util.Calendar;
import java.util.Date;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import com.javalec.common.utils.parser.FormPayload.FormPayloadBuilder;

public final class FormRequestBodyParser {
	
	public static FormPayload parse(HttpServletRequest request) throws IOException {
		try (BufferedReader reader = request.getReader()) {
			final FormPayloadBuilder builder = FormPayload.builder();
			
			reader.lines()
					.forEach((line) -> {
						try {
							for (var entry : line.split("&")) {
								System.out.println("entry: " + entry);
								String[] parsedEntry = entry.split("=");
								String name = parsedEntry[0];
								String data = parsedEntry.length > 1 ?
										URLDecoder.decode(parsedEntry[1], "utf-8")
										: "";
								
								builder.append(name, data);
							}
						} catch (UnsupportedEncodingException e) {
							e.printStackTrace();
						}
					});
			
			return builder.build();
		}		
	}
	
	public static <T> Optional<T> parseAs(HttpServletRequest request, Class<T> resultType) throws IOException { // ~.parseAs(SSignUpDto.class)
		// Reflection (not good for performance)
		FormPayload payload = parse(request);
		
		try {
			// TODO 전체 인자 생성자만 있다는 전제로 먼저 작성함.
			Constructor<T> constructor = (Constructor<T>) resultType.getDeclaredConstructors()[0];
			Parameter[] fields = constructor.getParameters();
		
			Object[] values = new Object[fields.length];
			for (int i = 0; i < fields.length; i++) {
				Parameter field = fields[i];
				String name = field.getName();
				values[i] = payload.getObject(name);
				if (fields[i].getType().isEnum()) {
					Class<Enum> clazz = (Class<Enum>) fields[i].getType();
					values[i] = Enum.valueOf(clazz, values[i].toString());
				} else if (fields[i].getType() == Instant.class && values[i] != null) {
					Date date = new SimpleDateFormat("yyyy-MM-dd")
							.parse(values[i].toString());
					Calendar calendar = Calendar.getInstance();
					calendar.setTime(date);
					
					LocalDate localDate = LocalDate.of(
							calendar.get(Calendar.YEAR),
							calendar.get(Calendar.MONTH) + 1,
							calendar.get(Calendar.DAY_OF_MONTH)
					);
					
					values[i] = localDate.atStartOfDay().toInstant(ZoneOffset.UTC);
				}
				System.out.printf("(at reflected constructor) (from payload) type: %s %s // %s=%s\n",
						fields[i].getType(),
						fields[i].getType().isEnum() ? "(enum)" : "",
						name,
						values[i]);
			}
			T result = (T) constructor.newInstance(values);
			
			return Optional.ofNullable(result);
		} catch (IllegalAccessException | IllegalArgumentException | SecurityException | InstantiationException | InvocationTargetException | ParseException e) {
			e.printStackTrace();
		}
		
		return Optional.empty();
	}

	private FormRequestBodyParser() {}
}

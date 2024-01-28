package com.javalec.common.utils.parser;

import java.io.Serializable;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public final class FormPayload implements Serializable {
	
	public static FormPayloadBuilder builder() {
		return new FormPayloadBuilder();
	}
	
	// delegation (위임)
	private final Map<String, Object> payload;
	
	private FormPayload(Map<String, Object> payload) {
		this.payload = payload;
	}
	
	public String getAsString(String key) {
		if (!(payload.get(key) instanceof String)) {
			throw new RuntimeException(
					"String이 아닌 값에 대하여 String으로 반환이 요구되었습니다."
			);
		}
		
		return (String) payload.get(key);
	}
	
	public Integer getAsInteger(String key) {
		if (!(payload.get(key) instanceof Integer)) {
			throw new RuntimeException("Integer가 아닌 값에 대하여 Integer로 반환이 요구되었습니다.");
		}
		
		return (Integer) payload.get(key);
	}
	
	public Object getObject(String key) {
		return payload.get(key);
	}
	
	public List<String> names() {
		return payload.keySet().stream().toList();
	}
	
	public Map<String, Object> toMap() {
		return new ConcurrentHashMap<>(payload); // copied clone
	}
	
	public static class FormPayloadBuilder {
		private final Map<String, Object> payload;
		
		public FormPayloadBuilder() {
			payload = new ConcurrentHashMap<>();
		}
		
		public FormPayloadBuilder append(String name, Object data) {
			payload.put(name, data);
			return this;
		}
		
		public FormPayload build() {
			return new FormPayload(payload);
		}
	}

	@Override
	public String toString() {
		return "FormPayload [payload=" + payload + "]";
	}
}

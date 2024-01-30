<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign-up(회원가입)</title>
<!-- Tailwind CSS -->
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
	<main class="flex justify-center items-center w-screen p-4 w-screen min-h-screen bg-gradient-to-tr from-[rgb(247,202,201)] to-[#92a8d1]">
		<form action="./signUp.do" method="post" name="membership"
			<%-- sm 스몰, md가 medium, lg가 라지, xl 엑스라지 --%>
				class="grid grid-cols-3 p-4 gap-x-2 gap-y-8 w-[80vw] max-w-[28rem] border rounded-md shadow-lg bg-slate-50 p-8 bg-opacity-50"
		>
			<header class="col-span-3 text-center">
				<h1 class="text-xl font-black select-none">Sign Up!</h1>
			</header>
			<p>아이디*</p>
			<fieldset class="flex flex-col col-span-2">
				<input type="text" id="userId" name="userId"
					class="peer w-full min-w-0 border border-black rounded-md px-2 text-left invalid:border-red-600 invalid:outline-red-800 duration-150 active:scale-[0.98]"
					onblur="applyValidation(this.id)"
				>
				<label
					for="userId" class="text-red-600 hidden peer-invalid:block text-sm">
					아이디는 영문 대소문자, 숫자를 조합하여 3글자 이상으로 입력하십시오.
				</label>
			</fieldset>
			<p>비밀번호*</p>
			<fieldset class="flex flex-col col-span-2">
				<input type="password" id="password" name="password"
					class="peer w-full min-w-0 border border-black rounded-md px-2 text-left invalid:border-red-600 invalid:outline-red-800 duration-150 active:scale-[0.98]"
					onblur="applyValidation('password')"
				>
				<label
					for="password" class="text-red-600 hidden peer-invalid:block text-sm">
					비밀번호는 영문 대소문자, 숫자 8자리 이상.
				</label>
			</fieldset>
			<p>성명*</p>
			<fieldset class="flex flex-col col-span-2">
				<input type="text" id="fullName" name="fullName"
					class="peer w-full min-w-0 border border-black rounded-md px-2 text-left invalid:text-slate-400 invalid:border-red-600 invalid:outline-red-800 duration-150 active:scale-[0.98]"
					onblur="applyValidation(this.id)"
				>
				<label
					for="fullName" class="text-red-600 hidden peer-invalid:block text-sm">
					성명은 완성된 한글로 두 글자 이상 입력하십시오.
				</label>
			</fieldset>
			<p>연락처*</p>
			<fieldset class="col-span-2 flex justify-between gap-2">
				<select id="tel1" name="tel1"
					onchange="updateTel(); if (value !== '0') tel2.focus()"
					class="appearance-none border border-black rounded-md px-2"
				>
					<option value="0" selected>선택</option>
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
					<option value="070">070</option>
					<option value="02">02</option>
					<option value="031">031</option>
					<option value="032">032</option>
					<option value="033">033</option>
					<option value="041">041</option>
					<option value="042">042</option>
					<option value="043">043</option>
					<option value="044">044</option>
					<option value="051">051</option>
					<option value="052">052</option>
					<option value="053">053</option>
					<option value="054">054</option>
					<option value="055">055</option>
					<option value="061">061</option>
					<option value="062">062</option>
					<option value="063">063</option>
					<option value="064">064</option>
				</select>
				<span>-</span>
				<input type="text" id="tel2" name="tel2" maxlength="4"
					class="border border-black rounded-md px-2 text-left min-w-0 w-14"
					oninput="if (this.value.length >= this.maxLength) tel3.focus(); updateTel();"
				>
				<span>-</span>
				<input type="text" id="tel3" name="tel3" maxlength="4"
					class="border border-black rounded-md px-2 text-left min-w-0 w-14"
					onblur="applyValidation('tel'); showOrHideTelMessage();"
					oninput="updateTel()"
				>
			</fieldset>
			<div id="tel_box" class="col-start-2 col-span-2 hidden">
				<input type="text" id="tel" name="tel" class="peer hidden">
				<label class="hidden peer-invalid:block text-red-600 text-sm">
					올바른 연락처를 입력하십시오.
				</label>
			</div>
			<p>생년월일</p>
			<fieldset class="flex flex-col col-span-2">
				<input type="date" id="birth" name="birth"
					class="border border-black rounded-md px-2" value="1999-01-01"
				>
			</fieldset>
			<p>성별</p>
			<fieldset class="flex flex-col col-span-2">
				<select id="gender" name="gender"
					class="w-full max-w-full overflow-hidden border border-black rounded-md px-1"
				>
					<option value="">선택</option>
					<option class="text-slate-300 font-bold" disabled>
						────────────
					</option>
					<option value="F">여성</option>
					<option value="M">남성</option>
				</select>
			</fieldset>
			<p>이메일</p>
			<fieldset class="flex flex-row col-span-2 justify-between">
				<input type="text" id="email1" name="email1" placeholder="이메일 ID 입력"
					onchange="updateEmail()"
					class="border border-black rounded-md px-2 min-w-0 w-24 placeholder:text-[0.5em] placeholder:-translate-y-0.5"
				>
				<span>@</span>
				<input type="text" id="email2" name="email2"
					placeholder="도메인 주소" onchange="updateEmail()"
					class="border border-black rounded-md px-2 min-w-0 w-24 placeholder:text-[0.5em] placeholder:-translate-y-0.5"
					list="domainSelect"
					onblur="applyValidation('email'); showOrHideEmailMessage();"
					oninput="updateEmail(this.value)"
				>
				<%-- <input type="hidden" id="email" name="email"> --%>
				<datalist id="domainSelect">
					<option value="aol.com">aol.com</option>
					<option value="daum.net">daum.net</option>
					<option value="gmail.com">gmail.com</option>
					<option value="hanmail.net">hanmail.net</option>
					<option value="hotmail.com">hotmail.com</option>
					<option value="icloud.com">icloud.com</option>
					<option value="kakao.com">kakao.com</option>
					<option value="live.com">live.com</option>
					<option value="naver.com">naver.com</option>
					<option value="outlook.com">outlook.com</option>
					<option value="yahoo.com">yahoo.com</option>
				</datalist>
			</fieldset>
			<div id="email_box" class="col-start-2 col-span-2 hidden">
				<input type="text" id="email" name="email" class="peer hidden">
				<label class="hidden peer-invalid:block text-red-600 text-sm">
					올바른 이메일 주소를 입력하십시오.
				</label>
			</div>
			<p>주소</p>
			<fieldset class="flex flex-col col-span-2 gap-2">
				<input type="text" id="address" name="address"
					placeholder="도로명 주소를 입력하세요"
					class="border border-black rounded-md px-2 invalid:border-red-600"
					onblur="applyValidation(this.id); this.value = this.value.trim();"
				>
				<input type="text" id="addressDetail" name="addressDetail"
					placeholder="상세 주소를 입력하세요"
					class="border border-black rounded-md px-2 invalid:border-red-600"
					onblur="applyValidation(this.id); this.value = this.value.trim();"
				>
			</fieldset>
			<div class="col-span-3 flex justify-end pr-4">			
				<button
					id="submit"
					class="w-fit border-2 border-black rounded-lg bg-[#92a8d1] px-4 py-2 font-bold text-white duration-150 active:scale-95 drop-shadow-md"
				>
					회원 가입
				</button>
			</div>
		</form>
	</main>
	<script defer>
		window.addEventListener('DOMContentLoaded', (contentLoadedEvent) => {
			// submit.addEventListener('click', (e) => e.preventDefault());
		});
	</script>
	
	<script>
		/**
	  	 * id로 지정한 요소에 validation 적용
		 */
		const applyValidation = (id) => {
			const element = document.getElementById(id);

			const requiredMap = {
				userId: true,
				password: true,
				fullName: true,
				tel: true,
				birth: false,
				gender: false,
				email: true,
				address: false,
			};
			
			const patternMap = {
				userId: '[A-Za-z0-9]{3,}',
				password: '^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,100}$',
				fullName: '[가-힣]{2,}',
				tel: '^\\d{2,3}-?\\d{3,4}-?\\d{4}$', // ^ 시작 $ 끝  // \d 정수
				birth: null,
				gender: null,
				email: '^[^\\sㄱ-ㅎㅏ-ㅣ가-힣]+@[a-zA-Z0-9.-]+(?:\\.[a-zA-Z]{2,})+$', // ^ 시작 $ 끝
				address: '[\\s가-힣A-Za-z0-9]{3,}',
				addressDetail: '[\\s가-힣A-Za-z0-9]{2,}',
			}
			
			element.required = requiredMap[id];
			if (patternMap[id] != null) {
				element.pattern = patternMap[id];
			}
		};
		
		// Arrow Function
		const updateEmail = () => {
			email.value = email1.value + '@' + email2.value;
			console.debug('email.validity.valid : ', email.validity.valid);
			showOrHideEmailMessage();
		};
		
		const showOrHideEmailMessage = () => {
			email_box.style.display = email.validity.valid ? 'none' : 'block';
		}
		
		const updateTel = () => {
			tel.value = tel1.value + '-' + tel2.value + '-' + tel3.value;
			console.debug('tel.validity.valid: ', tel.validity.valid);
			showOrHideTelMessage();
		};
		
		const showOrHideTelMessage = () => {
			tel_box.style.display = tel.validity.valid ? 'none' : 'block';
		}
		
		const submitForm = () => {
			
		}
	</script>
</body>
</html>
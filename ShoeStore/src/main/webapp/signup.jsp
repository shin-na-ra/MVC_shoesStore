<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Sign-up(회원가입)</title>
		<!-- Tailwind CSS -->
		<script src="https://cdn.tailwindcss.com"></script>
		<style>
			#domainSelect option.hr {
				border-top: 1px solid #000;
			}
		</style>
	</head>
	<body>
		<main class="flex justify-center items-center w-screen p-4">
			<form
				action=""
				method="post"
				name="membership"
				<%-- sm 스몰, md가 medium, lg가 라지, xl 엑스라지 --%>
				class="grid grid-cols-3 p-4 gap-2 w-[80vw] max-w-[23rem] border rounded-md shadow-md"
			>
					<p class="">아이디</p>
					<fieldset class="flex flex-col col-span-2">
						<input
							type="text"
							id="userid"
							name="userid"
							class="peer w-full min-w-0 border border-black invalid:border-red-600 invalid:outline-red-800"
							onblur="applyValidation('userid')"
							style="text-align: left; padding-left: 5px"
							<%--
							required
							pattern="[A-Za-z0-9]{3,}"
							--%>
							
							<%-- 우선 아무거나 썼어. --%>
						>
						<label for="userid" class="text-red-600 hidden peer-invalid:block">
							아이디는 영문 대소문자, 숫자를 조합하여 3글자 이상으로 입력하십시오.
						</label>
					</fieldset>
					<p class="">비밀번호</p>
					<fieldset class="flex flex-col col-span-2">
						<input
							type="password"
							id="password"
							name="password"
							class="peer w-full min-w-0 border border-black invalid:border-red-600 invalid:outline-red-800"
							onblur="applyValidation('password')"
						>
						<label for="password" class="text-red-600 hidden peer-invalid:block">
							비밀번호는 영문 대소문자, 숫자 8자리 이상.
						</label>
					</fieldset>
				<div>
					<p>성명</p>
					<input
						type="text"
						id="fullName"
						name="full_name"
						class="peer w-full min-w-0 border border-black invalid:border-red-600 invalid:outline-red-800"
						onblur="applyValidation(this.id)"
						style="text-align: left; padding-left: 5px"
					>
				</div>
				<div>
					<p>전화번호</p>
					<select
						id="phone1"
						name="phone1"
					>
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
					-
					<input
						type="text"
						id="phone2"
						name="phone2"
						maxlength="4"
						size="4"
						style="text-align: left; padding-left: 5px"
					>
					-
					<input
						type="text"
						name="phone3"
						maxlength="4"
						size="4"
						style="text-align: left; padding-left: 5px"
					>
				</div>
				<div>
					<p>생년월일</p>
					<input
						type="date"
						id="birthdate"
						name="birthdate"
					>
				</div>
				<div>
					<p>성별</p>
					<select
						id="gender"
						name="gender"
					>
						<option value="male">남성</option>
						<option value="female">여성</option>
						<option value="other">기타</option>
					</select>
				</div>
				<div>
					<p>이메일</p>
					<input
						type="text"
						id="email1"
						name="email1"
						placeholder="이메일 ID 입력"
						onchange="updateEmail()"
						style="text-align: left; padding-left: 5px"
					>
					@
					<input
						type="text"
						id="email2"
						name="email2"
						placeholder="도메인 주소 선택"
						onchange="updateEmail()"
						style="text-align: left; padding-left: 5px"
						disabled
					>
					<input
						type="hidden"
						id="email"
						name="email"
					>
					<select
						id="domainSelect"
						name="domainSelect"
						onchange="updateEmail2(this.value)">
						<option value="">도메인 선택</option>
						<option class="hr" disabled>─────────</option>
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
						<%-- 선택지에 필요한 도메인을 추가할 수 있습니다. --%>
						<option class="hr" disabled>─────────</option>
						<option value="직접입력">직접 입력</option>
					</select>
				</div>
				<div>
					<p>주소</p>
					<input
						type="text"
						id="postcode"
						name="postcode"
						placeholder="우편번호를 입력하세요"
						style="text-align: left; padding-left: 5px"
					>
					<br>
					<input
						type="text"
						id="address"
						name="address"
						placeholder="도로명 주소를 입력하세요"
						style="text-align: left; padding-left: 5px"
					>
					<br>
					<input
						type="text"
						id="detail-address"
						name="detail-address"
						placeholder="상세 주소를 입력하세요"
						style="text-align: left; padding-left: 5px"
					>
				</div>
				<div>
					<p>기타등등</p>
				</div>
			</form>
		</main>
		<script>
		/**
	  	 * id로 지정한 요소에 validation 적용
		 */
		const applyValidation = (id) => {
			const element = document.getElementById(id);

			const requiredMap = {
				userid: false,
				password: true,
				fullName: true,
				tel: false,
				birth: false,
				gender: false,
				email: false,
				address: false,
			};
			
			const patternMap = {
				userid: '[A-Za-z0-9]{3,}',
				password: '[A-Za-z0-9]{3,}',
				fullName: '[가-힣]{2,}',
				tel: '^\d{2,3}-\d{3,4}-\d{4}$', // ^ 시작 $ 끝  // \d 정수
				birth: null,
				gender: null,
				email: '^[^\sㄱ-ㅎㅏ-ㅣ가-힣]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$', // ^ 시작 $ 끝  // \d 정수
				address: '[A-Za-z0-9]{3,}',
			}
			
			element.required = requiredMap[id];
			if (patternMap[id] != null) {
				element.pattern = patternMap[id];
			}
		};
		
		// Arrow Function
		const updateEmail = () => {
			email.value = email1.value + '@' + email2.value;
		};
		
		/**  */
		function updateEmail2(value) {
			// var email2 = document.querySelector("[name=email2]");
			
			if (value == "직접입력") {
				email2.value = ""; // 직접 입력을 선택한 경우 email2 초기화
				email2.disabled = false; // email2 활성화
				email2.placeholder = "직접 입력"; // placeholder 변경
			} else {
				email2.setAttribute('value', value);
				// email2.value = value; // 선택한 도메인을 email2에 표시
				email2.disabled = true; // email2 비활성화
				email2.placeholder = "도메인 주소 선택"; // placeholder 변경
			}
		}
		</script>
	</body>
</html>
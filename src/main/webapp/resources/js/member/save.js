function addressAPI() {
  new daum.Postcode({
    oncomplete: function(data) {
      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

      // 각 주소의 노출 규칙에 따라 주소를 조합한다.
      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
      let address = ''; // 주소 변수

      //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
      if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
        address = data.roadAddress;
      } else { // 사용자가 지번 주소를 선택했을 경우(J)
        address = data.jibunAddress;
      }

      // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
      if(data.userSelectedType === 'R'){
        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
          address += data.bname;
        }
        // 건물명이 있고, 공동주택일 경우 추가한다.
        if(data.buildingName !== '' && data.apartment === 'Y'){
          address += (address !== '' ? ', ' + data.buildingName : data.buildingName);
        }

      } else {
        // document.getElementById("sample6_extraAddress").value = '';
      }

      // 우편번호와 주소 정보를 해당 필드에 넣는다.
      document.getElementById('memberZipCode').value = data.zonecode;
      document.getElementById("memberAddress1").value = address;
      // 커서를 상세주소 필드로 이동한다.
      document.getElementById("memberAddress2").focus();
    }
  }).open();
}

const submitButton = () => {
  const inputMemberId = document.getElementById("input-memberId").value;

  const inputMemberPassword = document.getElementById("input-memberPassword").value;

  const inputMemberPasswordAgain = document.getElementById("input-memberPassword-again").value;

  const inputMemberName = document.getElementById("input-memberName").value;

  const inputMemberZipcode = document.getElementById("memberZipCode").value;
  const inputMemberAddress1 = document.getElementById("memberAddress1").value;
  const inputMemberAddress2 = document.getElementById("memberAddress2").value;

  if (inputMemberId === '' || inputMemberPassword === '' || inputMemberPasswordAgain === ''
      || inputMemberName === '' || inputMemberZipcode === '' || inputMemberAddress1 === ''
      || inputMemberAddress2 === '') {
    alert('입력하지 않은 정보가 있어요!');
    return false;
  } else {
    if (idCheck() && pwCheck() && pwAgainCheck()
        && nameCheck() && emailCheck() && mobileCheck()) {
      memberSaveForm.submit();
    }
  }

}

const idCheck = () => {
  const inputMemberId = document.getElementById("input-memberId").value;
  const resultMemberId = document.getElementById("id-result");
  const exp = /^[a-z\d-_]{5,15}$/;
  let check;

  if (inputMemberId.match(exp)) {
    resultMemberId.style.display = 'none';
    resultMemberId.setAttribute("aria-hidden", "true");
    check = true;
  } else {
    resultMemberId.innerHTML = '5~15자의 영문 소문자, 숫자와 특수기호 (-), (_)만 사용 가능합니다.';
    resultMemberId.style.color = '#aa3636';
    resultMemberId.style.display = 'block';
    resultMemberId.setAttribute("aria-hidden", "false");
    check = false;
  }
  return check;
}

const pwCheck = () => {
  const inputMemberPassword = document.getElementById("input-memberPassword").value;
  const resultMemberPassword = document.getElementById("pw-result");
  const exp = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$/;
  let check;

  if (!inputMemberPassword.match(exp)) {
    resultMemberPassword.innerHTML = '8~16자의 영문 대 소문자, 숫자, 특수문자(!@#$%^&*)를 사용하세요.';
    resultMemberPassword.style.color = '#aa3636';
    resultMemberPassword.style.display = 'block';
    resultMemberPassword.setAttribute("aria-hidden", "false");
    check = false;
  } else {
    resultMemberPassword.style.display = 'none';
    resultMemberPassword.setAttribute("aria-hidden", "true");
    check = true;
  }
  return check;
}

const pwAgainCheck = () => {
  const inputMemberPassword = document.getElementById("input-memberPassword").value;
  const inputMemberPasswordAgain = document.getElementById("input-memberPassword-again").value;
  const resultMemberPasswordAgain = document.getElementById("pw-again-result");
  let check;

  if (inputMemberPassword === inputMemberPasswordAgain) {
    resultMemberPasswordAgain.innerHTML = '비밀번호가 일치합니다.';
    resultMemberPasswordAgain.style.color = '#36aa36';
    resultMemberPasswordAgain.style.display = 'block';
    resultMemberPasswordAgain.setAttribute("aria-hidden", "false");
    check = true;
  } else {
    resultMemberPasswordAgain.innerHTML = '비밀번호가 일치하지 않습니다.';
    resultMemberPasswordAgain.style.color = '#aa3636';
    resultMemberPasswordAgain.style.display = 'block';
    resultMemberPasswordAgain.setAttribute("aria-hidden", "false");
    check = false;
  }
  return check;
}

const nameCheck = () => {
  const inputMemberName = document.getElementById("input-memberName").value;
  const resultMemberName = document.getElementById("name-result");
  const exp = /^[a-zA-Z가-힣]{2,20}$/;
  let check;

  if (!inputMemberName.match(exp)) {
    resultMemberName.innerHTML = '2~20자 이내의 한글과 영문 대 소문자를 사용하세요.';
    resultMemberName.style.color = '#aa3636';
    resultMemberName.style.display = 'block';
    resultMemberName.setAttribute("aria-hidden", "false");
    check = false;
  } else {
    resultMemberName.style.display = 'none';
    resultMemberName.setAttribute("aria-hidden", "true");
    check = true;
  }
  return check;
}

const emailCheck = () => {
  const inputMemberEmail = document.getElementById("input-memberEmail").value;
  const resultMemberEmail = document.getElementById("email-result");
  const exp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i
  let check;

  if (inputMemberEmail.match(exp)) {
    resultMemberEmail.style.display = 'none';
    resultMemberEmail.setAttribute("aria-hidden", "true");
    check = true;
  } else {
    resultMemberEmail.innerHTML = '이메일 주소를 다시 확인해주세요.';
    resultMemberEmail.style.color = '#aa3636';
    resultMemberEmail.style.display = 'block';
    resultMemberEmail.setAttribute("aria-hidden", "false");
    check = false;
  }
  return check;
}

const mobileCheck = () => {
  const inputMemberMobile = document.getElementById("input-memberMobile").value;
  const resultMemberMobile = document.getElementById("mobile-result");
  const exp = /^01[0179][0-9]{7,8}$/;
  let check;

  if (!inputMemberMobile.match(exp)) {
    resultMemberMobile.innerHTML = '전화번호를 다시 확인해주세요.';
    resultMemberMobile.style.color = '#aa3636';
    resultMemberMobile.style.display = 'block';
    resultMemberMobile.setAttribute("aria-hidden", "false");
    check = false;
  } else {
    resultMemberMobile.style.display = 'none';
    resultMemberMobile.setAttribute("aria-hidden", "true");
    check = true;
  }
  return check;
}


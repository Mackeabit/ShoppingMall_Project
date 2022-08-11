function count(type)  {
  // 결과를 표시할 element
  const resultElement = document.getElementById('result');

  // 현재 화면에 표시된 값
  let number = resultElement.innerText;
	
  // 더하기/빼기
  if(type === 'plus') {
    number = parseInt(number) + 1;
  }else if(type === 'minus')  {
  	if(number < 1){
  		alert("1개 미만으로 선택할 수 없습니다.");
  		return false;
  	}
    number = parseInt(number) - 1;
  }

  // 결과 출력
  resultElement.innerText = number;
}

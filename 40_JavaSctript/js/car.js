
    // (실습) 옵션 선택 여부에 따라 차량 금액 변경처리
    let totalTag; // 차량금액 표시할 HTML 태그 객체 저장
    let totalValue = 0; // 차량금액 + 옵션금액 저장
    window.onload = function(){
        totalTag = document.getElementById("total");
        totalValue = parseInt(totalTag.value);

        // document.getElementById("opt1").onclick = function(){
        //     // 콜백함수 내의 this는 이벤트 발생객체
        //     compute(this);
        // };

        // ID로 각각 찾아서 이벤트 연결
        // document.getElementById("opt1").onclick = compute;
        // document.getElementById("opt2").onclick = compute;
        // document.getElementById("opt3").onclick = compute;

        // class 속성으로 찾아서 이벤트 연결
        let opts = document.getElementsByClassName("opt");

        // for(let i = 0; i < opts.length; i++){
        //     opts[i].onclick = compute;
        // }

        for(let opt of opts){
            opt.onclick = compute;
        }
    };

    function compute(opt){
        console.log("this : " + this.id);
        let optValue = parseInt(this.value);
        console.log("optValue : " + optValue);

        if(this.checked){
            totalValue += optValue;
        }else{
            totalValue -= optValue;
        }
        // 화면에 결과 값 표시
        totalTag.value = totalValue;
    }

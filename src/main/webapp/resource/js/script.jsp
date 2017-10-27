<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <script type="text/javascript">
      /*     string var s= ""
       array var ar = []
       object var ob ={}  */
      /* 
       var x = new Object();
       x.name = new String("newlec");
       x.phone = new String("010-111-22222");
       alert(x.phone);

       var x = {};
       x.name = "newlec";
       x.phone = "010-111-2222";
       alert(x.name);
       */

      /*     var json = [
       {id:"1", title:"hello", "wirter id":"newlec"},
       {id:"2", title:"good", "wirter id":"newlec"}
       ];
       alert(json[1].title);
       alert(json[1]["title"]);
       alert(json[1]["wirter id"]); */

      /*
       //()안 json코드면 json.parse, 아니면 eval 
       var data = eval('({id:"1", title:"hello", "wirter id":"newlec"})');
       var data = JSON.parse('{"id":1, "title":"hello", "wirter id":"newlec"}');
       alert(typeof data.title); 
       */

      /* 
       var x = 3.5;
       var y = "2";   // 뺄셈은 문자가 숫자로, 덧셈은 숫자가 문자로
      
       alert(x + y);   // 값 비교 
       alert(x === y);   // 주소, 값 비교
       */

      /*    var data = [2, 4, 6, 8, 0];
       var entity = {id:1, title:"Hello", writerId:"newlec"};
      
       for(var i=0; i<data.length; i++)
       alert(data[i]);
       for(var i in data)   // index 값 꺼내서 함, 배열이나 개체나 순회방법 같게 해줌
       alert(data[i]);
       for(var k in entity)
       alert(entity[k]);    
       */

      /*    //var add = new Function("x, y", "return x+y");
       var add = function(x, y){
       return x+y
       };
       var add2 = function(){
       var sum = 0;
       for(var i=0; i<arguments.length; i++)
       sum += arguments[1];
       return sum;
       }
      
       alert(add2(3,8,10)); 
       */
      /* 
       {
       var a =1; // 중괄호 아무 의미 없음   
       }
      
       function{
       var a = 1;   // 중괄호 의미 가짐
       }
       */

      /*       function f1() {
       var a = 1;
       return function f2() {   // 클로저, but a가 전역이면 클로저 아님
       return a
       }
       }
      
       var f = f1();
       var a = f();
       alert(a); 
       */
      /* 
       var x, y;
       x = prompt("x 값을 입력하세요", 0);
       y = prompt("y 값을 입력하세요", 0);
       x=parseInt(x);
       y=parseInt(y);
       ; */
   </script>

   <!-- <script>
   function printResult(){
      var x, y;
      x = prompt("x 값을 입력하세요");
      y = prompt("y 값을 입력하세요");
       x=parseInt(x);
      y=parseInt(y); 
      
      btnPrint.value=x+y;
   }
</script>
<input type="button" value="출력" onclick="printResult();" id="btnPrint"/> -->
   <script type="text/javascript">
      function calcApp() {
         var xText = document.getElementById("x");
         var yText = document.getElementById("y");
         var addButton = document.getElementById("add-button");
         var resultText = document.getElementById("result");

         addButton.onclick = addBtnClick;

         function addBtnClick() {
            var x = parseInt(xText.value);
            var y = parseInt(yText.value);
            resultText.value = x + y;
         }
      }
      window.onload = calcApp;

      //--------초 세기--------------------------------

      window.onload = function() {
         var countButton = document.getElementById("count-button");
         var countLabel = document.getElementById("count-label");
         var timerId = null;

         var ex1 = document.getElementById("ex1");
         ex1.style.marginTop = "0px";

         countButton.onclick = function cntBtnClick() {

            if (timerId == null)
               setInterval(function() {
                  var count = parseInt(countLabel.textContent);
                  var marginTop = parseInt(ex1.style.marginTop);

                  if (count <= 0) {
                     clearInterval(timerId);
                     timerId = null;
                  }

                  if (marginTop >= 100) {
                     clearInterval(timerId);
                     timerId = null;
                  }

                  ex1.style.marginTop = (marginTop + 1) + "px";

                  //countLabel.textContent = count - 1; // 속성이 아닌 자식이 text인 경우 그것을 사용하고 싶을 때 textContent
               }, 30); // setTimeout은 한번만, setInterval은 계속
         }
      }

      //--------open & window------------------------------

      window.onload = function() {
         var obtn = document.getElementById("open-button");
         var mbtn = document.getElementById("mov-button");
         var win = null;

         var tbtn = document.getElementById("trans-button");
         var iframe = window.frames[0];

         obtn.onclick = function obtnClick() {
            if (win == null)
               win = open("notice.html", "-blank",
                     "width=500px height=500px");
         };
         mbtn.onclick = function mbtnClick() {
            if (win != null) {
               setInterval(function() {
                  win.moveBy(-10, 0);
               }, 30);
            }
         };
         tbtn.onclick = function tbtnClick() {
            //iframe.location.href="http://www.daum.net";
            iframe.document.write("Hello");
         };
      }

      //--------iframe--------------------------------

      /* window.onload = function() {
         var nbtn = document.getElementById("nav-button");
         var win = frames[0];   // frame을 가지는 배열
         
         nbtn.onclick = function nbtnClick(){
            win.location.href="http://www.newlecture.com";
         }
      } */

      //--------노드 순회--------------------------------
      window.onload = function() {
         var chbtn = document.getElementById("ch-button");
         var p = document.getElementById("p");

         chbtn.onclick = function() {
            p.style.background = "orange";
            p.firstElementChild.style.border = "1px solid black";

            for (var node = p.firstChild; node != null; node = node.nextSibling)
               alert(node.nodeType);
         };
      };

      //--------노드 순회 Selector--------------------------------

      window.onload = function() {
         var chbtn = document.querySelector("#ch-button1");
         //var p = document.querySelector("#module1>div:nth-child(2)>div");   // #module1>div:first-child + div>div
         var divs = document.querySelectorAll("#module1 > div");
         var p = divs[1].querySelector("div");

         chbtn.onclick = function() {
            p.style.background = "orange";
         };
      };

      //--------노드 순회 Selector--------------------------------
      onload = function() {
         var chImgButton = document.querySelector("#ch-img-button");
         var imgContainer = document.querySelector("#img-container");
         var img = imgContainer.querySelector("img");
         var text = document.querySelector("#img-src");

         chImgButton.onclick = function() {
            img.src = text.value;
         };
      };

      //--------자식 노드 변경--------------------------------
      onload = function() {
         var chNodeBtn = document.querySelector("#ch-node-button");
         var nodeContainer = document.querySelector("#ch-node-container");

         chNodeBtn.onclick = function() {
            nodeContainer.textContent = "<h1>hoho</h1>";
            nodeContainer.innerHTML = "<h1>hoho</h1>";
         };
      };

      //--------text 노드 추가--------------------------------
      onload = function() {
         var addTxtNodeBtn = document.querySelector("#add-txt-node-button");
         var addImgNodeBtn = document.querySelector("#add-img-node-button");
         var delNodeBtn = document.querySelector("#del-node-button");
         var nodeContainer = document.querySelector("#node-container");

         var remove = function(e) {
            nodeContainer.removeChild(e.target);
         };

         var idx = 0;

         addTxtNodeBtn.onclick = function() {
            var txt = document.createTextNode("안녕하세요" + idx++);
            var span = document.createElement("span");

            span.appendChild(txt);
            nodeContainer.appendChild(span);

            span.onclick = remove;
         };
         addImgNodeBtn.onclick = function() {
            /* var img = document.createElement("img");
            img.src = "http://www.travie.com/data/editor/1612/thumb-982933293_1480557706.03_640x427.jpg";
            nodeContainer.appendChild(img); */
            nodeContainer.innerHTML += '<img onclick="remove();" src="http://www.travie.com/data/editor/1612/thumb-982933293_1480557706.03_640x427.jpg" />'
         };
         delNodeBtn.onclick = function() {
            nodeContainer.removeChild(nodeContainer.lastChild);
         };
      };

      //--------노드 바꾸기--------------------------------
      window.addEventListener("load", function() {
         var swapBtn = document.querySelector("#swap-node-button");
         var container = document.querySelector("#node-swap-container");

         swapBtn.onclick = function() {
            var nodes = container.getElementsByTagName("img");
            var n1 = nodes[0];
            var n3 = nodes[2];
            var nodeNext = n1.nextElementSibling;

            container.replaceChild(n1, n3);
            container.insertBefore(n3, nodeNext);
         };
      });

      //--------노드 바꾸기 2--------------------------------
      window.addEventListener("load", function() {
         var mvUpBtn = document.querySelector("#move-up-button");
         var container = document.querySelector("#move-up-container");
         /* var trs = container.querySelectorAll("tbody tr");
         
         for(var i=0; i<trs.length; i++)
            trs[i].onclick = function(e){
               e.target.style.background = "orange";
         }; */
         var tbody = container.querySelector("tbody");
         var td = tbody.firstElementChild.lastElementChild;
         var tr = null;

         td.addEventListener("click", function(e) {
            //e.stopPropagation();
            console.log("td");
            e.target.style.background = "pink";
         }, true);

         tbody.addEventListener("click", function(e) {
            /* console.log("tbody");
            e.target.style.background = "orange"; */

            if (e.target.nodeName == "INPUT") {
               tr = e.target.parentNode.parentNode;
            }
         }, true);

         mvUpBtn.onclick = function() {

            if (tr == null)
               return;

            var bf = tr.previousElementSibling;
            var af = tr.nextElementSibling;

            if (bf == null) {
               tbody.replaceChild(af, tr);
               tbody.insertBefore(tr, tbody.lastElementSibling);
            } else if (af == null) {
               tbody.replaceChild(tr, bf);
               tbody.insertBefore(bf, tr.nextElementSibling);
            } else {
               tbody.replaceChild(tr, bf);
               tbody.insertBefore(bf, af);
            }
         };
      });

      //--------기본 행위 막기 예제--------------------------------
      window.addEventListener("load", function() {
         var titleText = document.querySelector("form input[name]");
         var submitButton = document
               .querySelector("form input[type='submit']");
         //진짜 지울꺼니? 확인해야지~
         var cancelButton = document.querySelector("form > a")

         submitButton.onclick = function(e) {
            if (titleText.value == "")
               alert("제목을 입력하세요.");
            e.preventDefault();
            //history(-1);
         };
         cancelButton.onclick = function(e) {
            if (titleText.value != "") {

               if (!confirm("작성중이던 입력을 취소하시겠습니까?"))
                  e.preventDefault();
               //else
            }
         }
      });

      //--------노드 복제--------------------------------
      window.addEventListener("load", function() {
         var cloneBtn = document
               .querySelector("#ex-clone input[value='단순복제']");
         var container = document.querySelector("#clone-container");
         var tbody = container.querySelector("tbody");

         cloneBtn.onclick = function(e) {
            var tr = tbody.querySelector("tr");

            var clone = tr.cloneNode(true);

            tbody.appendChild(clone);
         }

      });

      
      
      //--------Ajax로 파일 전송하기와 트리거 & 파일 목록 뷰어------------------------------
      window.addEventListener("load", function() {
         
    	  var submitBtn = document.querySelector("#ex3-upload span");
    	  var fileInput=document.querySelector("#ex3-upload input");
    	  var progressBar = document.querySelector("#ex3-upload  #progress-bar");
    	  progressBar.style.width = "0px";
    	  
    	  var fileViewer = document.querySelector("#ex3-upload  ul");
    	  //파일 목록 초기화
    	  
    	  
    	  var xhr= new XMLHttpRequest();
			  
			 xhr.onload=function(e){	  
	
		    	  var files=JSON.parse(e.target.responseText);
		    	
		    	  
		    	  for(var i=0; i<files.length;i++){
		    		  var li = document.createElement("li");
		        	  //var a = document.createElement("a");
		        	  li.textContent = files[i];
		        	  fileViewer.appendChild(li);
		  
		    	  }
	
				 
 			  };
 			  
 			  xhr.open("GET","../../file-list");
 			  xhr.send();
 			  
    	  
    	
    	 
    	  submitBtn.onclick=function(e){
    		 var event = new MouseEvent("click", {
    			 'view':window,
    			 'bubles':true,
    			 'cancelable':true
    			 
    		 });
    		/*  //file.dispatchEvent(event);
    		 console.log("bf");
    		  fileInput.dispatchEvent(event); //대화상자 열고 닫기 전에 af가 찍히는 지 확인. 열자마자 bf,af가 나와버림. 
    		  console.log("af");
    		  for(var key in fileInput.files[0]) // 즉 이부분이 실행되는 게 닫기 전에 실행된다는거
    			  alert(key);
    	 */
    		  console.log("bf");
       		  fileInput.dispatchEvent(event); 
       		  fileInput.onchange=function(){
       			  var file=fileInput.files[0];
       			
       			  var formData = new FormData(); //multipart방식의 form
       			  formData.append("title","테스트");
       			  formData.append("file",file);
       			  
       			  var xhr= new XMLHttpRequest();
       			  
       			xhr.upload.onprogress = function(e){
       				var percent = Math.round(e.loaded*100/e.total);
       				progressBar.textContent = percent+"%"
       				progressBar.style.width = percent + "px";
       	         };
       	         
       	         
       	         //loaded : x = total : 100 x=
       			  xhr.onload=function(){	  
       			  };
       			  
       			  xhr.onerror=function(e){
       				  alert("오류");
       			  };
       			  
       			  xhr.open("POST","../../upload?${_csrf.parameterName}=${_csrf.token}");
       			  xhr.send(formData);
       			  
       			  
       		//	alert(file.name);
       			  /*   for(var key in fileInput.files[0]) 
           			  alert(key); */
       		  }
       		  console.log("af");
       		
    	  };
   
      });
      

      
      //--------Template 태그 이용한 노드 복제 & Ajax--------------------------------
      window.addEventListener("load", function() {
         var cloneBtn = document.querySelector("#ex2-clone input[value='Template 복제']");
         var ajaxBtn = document.querySelector("#ex2-clone input[value='Ajax 요청']");
         var tbody = document.querySelector("#ex2-clone tbody");
         var template = document.querySelector("#ex2-clone template");
         var container = document.querySelector("#ex2-clone div:first-child");
         
         var data = [
            {id:"1", title:"타이틀1", noticeId:"아이디1"},
            {id:"2", title:"타이틀2", noticeId:"아이디2"},
            {id:"3", title:"타이틀3", noticeId:"아이디3"}
         ];
         
         
         ajaxBtn.onclick = function(e) {
            //비동기형으로 문서를 요청한 방식
        	 var xhr = new XMLHttpRequest();
            /*  xhr.onreadystatechange= function(e){
            	 //ready상태가 변경
            	 if(xhr.readyState == 4)
            	 data = eval(xhr.responseText);
             }; */
             xhr.onload = function(){
            	/* alert(xhr.responseText); */
            	 /* data = eval(xhr.responseText); */
            	 data = JSON.parse(xhr.responseText);
            	 //2.ajax icon 제거
            	 container.removeChild(container.lastChild);
             };
             xhr.onerror=function(e){
            	 
            	alert("예기치 못한 오류가 발생 !!!!!!!!!!!!!!!!!!!!!!!") 
             };
             xhr.open("GET", "../../customer/notice-ajax", true);
             xhr.send();
             //1. ajax-icon 추가
          	var img=document.createElement("img");
          	 img.src="../img/ajax-loader.gif";
         	container.appendChild(img);
         };
         
       /*동기형으로 문서를 요청한 방식  
       ajaxBtn.onclick = function(e) {
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "../../customer/notice-ajax", false);
            xhr.send();
            data = eval(xhr.responseText);
         } */
         

         cloneBtn.onclick = function(e) {
            if('content' in template){
               for(var i=0; i<data.length; i++){
                  // 값이 설정된 content 복제
                  var clone = document.importNode(template.content, true);
               
                  // template의 content에 값을 설정
                  var tds = clone.querySelectorAll("td");
                  tds[0].appendChild(document.createTextNode(data[i].id));
                  tds[1].textContent = data[i].title;
                  tds[2].textContent = data[i].noticeId;
               
                  // 복제된 clone(tr)을 노드 트리에 추가
                  tbody.appendChild(clone);
               }
            }
         }

      });
      
      
   </script>

   <!-- 더하기 html -->

   <div id="ex1">
      <input type="text" id="x" placeholder="x값을 입력하세요" /> <input
         type="text" id="y" placeholder="y값을 입력하세요" /> <input type="button"
         value="더하기" id="add-button" /> <input type="text" value=""
         id="result" />
   </div>
   <p>
   <hr />

   <!-- 초 세기 html -->
   <p>
      남은시간 <span id="count-label">60</span>초 <input id="count-button"
         type="button" value="카운트 시작" />
   </p>
   <p>
   <hr />

   <!-- open & win -->
   <div>
      <input id="open-button" type="button" value="새창" /> <input
         id="mov-button" type="button" value="왼쪽으로 이동" /> <input
         id="trans-button" type="button" value="페이지이동" />
   </div>
   <p>
   <hr />

   <!-- iframe -->

   <div>
      <input id="nav-button" type="button" value="페이지 전환" />
      <iframe src="notice.html" style="width: 500px; height: 500px;"></iframe>
   </div>

   <!-- 노드 순회 -->
   <p>
   <hr />
   <input id="ch-button" type="button" value="배경색 변경" />
   <div>
      <div>1</div>
      <div id="p">
         <div>2</div>
         <!-- p 주석 test -->
      </div>
      <div>3</div>
   </div>

   <!-- 노드 순회 API -->
   <p>
   <hr />
   <input id="ch-button1" type="button" value="배경색 변경" />
   <div id="module1">
      <div>1</div>
      <div>
         <div>2</div>
         <!-- p 주석 test -->
      </div>
      <div>3</div>
   </div>

   <!-- 속성 변경 -->
   <p>
   <hr />
   <input id="img-src" type="text" />
   <input id="ch-img-button" type="button" value="이미지 변경" />
   <div id="img-container">
      <img
         src="http://www.travie.com/data/editor/1612/thumb-982933293_1480557706.03_640x427.jpg">
   </div>

   <!-- 자식 노드 변경 -->
   <p>
   <hr />
   <input id="ch-node-button" type="button" value="자식노드 변경" />
   <div id="ch-node-container">hello</div>

   <!-- text 노드 추가 -->
   <p>
   <hr />
   <input id="add-txt-node-button" type="button" value="텍스트 노드 추가" />
   <input id="add-img-node-button" type="button" value="이미지 노드 추가" />
   <input id="del-node-button" type="button" value="노드 삭제" />
   <div id="node-container"></div>

   <!-- 노드 바꾸기 -->
   <p>
   <hr />
   <input id="swap-node-button" type="button" value="노드 바꾸기" />
   <div id="node-swap-container">
      <img src="../img/a.jpg"> <img src="../img/b.jpg"> <img
         src="../img/c.jpg">
   </div>


   <!-- 노드 바꾸기 2 -->
   <p>
   <hr />
   <input id="move-up-button" type="button" value="위로 올리기" />
   <div id="move-up-container">
      <table border="1">
         <thead>
            <tr>
               <td></td>
               <td>코드</td>
               <td>제목</td>
            </tr>
         </thead>
         <tbody>
            <tr>
               <td><input name="id" type="radio" value="1" /></td>
               <td>1</td>
               <td>아~옛날이여!</td>
            </tr>
            <tr>
               <td><input name="id" type="radio" value="2" /></td>
               <td>2</td>
               <td>안 졸리다</td>
            </tr>
            <tr>
               <td><input name="id" type="radio" value="3" /></td>
               <td>3</td>
               <td>안 졸릴껄??</td>
            </tr>
            <tr>
               <td><input name="id" type="radio" value="4" /></td>
               <td>4</td>
               <td>안졸린건가..?</td>
            </tr>
            <tr>
               <td><input name="id" type="radio" value="5" /></td>
               <td>5</td>
               <td>졸ㄹ려!!!!!!!!!!!!!!!!!!!!</td>
            </tr>
         </tbody>
      </table>
      <!-- <img src="../img/a.jpg"> <img src="../img/b.jpg"> <img
         src="../img/c.jpg"> -->
   </div>

   <!-- 기본 행위 막기 예제 -->
   <p>
   <hr />
   <form>
      <input type="text" name="title" /><br> <input type="submit"
         value="전송" /> <a href="">취소</a>
   </form>

   <!-- 노드 복제 -->
   <p>
   <hr />
   <div id="ex-clone">
      <div>
         <input type="button" value="단순복제" />
      </div>
      <div id="clone-container">
         <table border="1">
            <thead>
               <tr>
                  <td></td>
                  <td>코드</td>
                  <td>제목</td>
               </tr>
            </thead>
            <tbody>
               <tr>
                  <td><input name="id" type="radio" value="1" /></td>
                  <td>1</td>
                  <td>아~옛날이여!</td>
               </tr>
            </tbody>
         </table>
      </div>
   </div>

   <!-- Template 태그 이용한 노드 복제 & Ajax -->
   <p>
   <hr />
   <div id="ex2-clone">
      <div>
         <input type="button" value="Template 복제" />
         <input type="button" value="Ajax 요청" />
      </div>
      <div id="clone-container">
         <table border="1">
            <thead>
               <tr>
                  <td></td>
                  <td>코드</td>
                  <td>제목</td>
               </tr>
            </thead>
            <tbody>
            </tbody>
         </table>
         <template>
            <tr>
               <td><input name="id" type="radio" value="1" /></td>
               <td></td>
               <td></td>
            </tr>
         </template>
      </div>
   </div>
   
   
    <!--  Ajax로 파일 전송하기와 트리거 . 트리거란 방아쇠를 당기는 거. 내가 파일선택을 누르면 저 file이 눌린것처럼 하고 싶을 때 트리거 이용. 파일 목록 뷰어-->
   <p>
   <hr />
   <div id="ex3-upload">
   	<input type="file" style="display:none;"/>
   	<span style="border:1px solid #999; border-radius:5px; background : pink; padding:3px; cursor:pointer;">파일선택</span>
   	<span id="progress-bar" style="background : pink; display:inline-block;"></span>
   	
   	
   	<div>
   		<ul>
   			<li></li>
   		</ul>
   	</div>
  <%-- 	 <form action="../../upload?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
	     <div>
	     	 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"  />
	         <input type="submit" value="전송" />
	         <input type="button" value="Ajax 요청" />
	      </div>
	      <div id="clone-container">
	         <table border="1">
	            <tbody>
	               <tr>
	                  <td>제목</td>
	                  <td><input type="text" name="title"/></td>
	               </tr>
	               
	                <tr>
	                  <td>첨부파일</td>
	                  <td><input type="file" name="file"/></td>
	               </tr>
	            </tbody>
	         
	         </table>
	         
	     </div>
      </form> --%>
   </div>
   

</body>
</html>
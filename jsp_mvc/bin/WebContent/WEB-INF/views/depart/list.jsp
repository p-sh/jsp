<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<body> 
<div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">직원 리스트</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<table border="1" class="table">
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>아이디</th>
				<th>비번</th>
				<th>성별</th>
				<th>취미</th>
				<th>주소</th>
			</tr>
			<tbody id="user_tbody">
				<tr>
					<td colspan="4">유저데이터가 없습니다.</td>
				</tr>
			</tbody>
		</table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">Save changes</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
	<div class="container">
		<table class="table">
			<tr>
				<th>부서번호</th>
				<th>부서이름</th>
				<th>부서설명</th>
				<th>부서인원</th>
			</tr>
			<tbody id="departTbody">
				<tr>
					<td colspan="4">부서정보가 없습니다.</td>
				</tr>
			</tbody>
		</table>
	</div>
<script>
	$(document).ready(function(){
		var p = {};
		p = JSON.stringify(p);
		
		$.ajax({
			url : '/depart/list',
			data : 'param=' + encodeURIComponent(p),
			dataType : 'json',
			success : function(res){
				var html =""
				for(var idx in res){
					var dp = res[idx];
					html += "<tr>";
					html += "<td>" + dp.dpNum + "</td>";
					html += "<td>";
					html += "<button type='button' onclick='showPop(" + dp.dpNum + ")'class='btn btn-primary' data-toggle='modal' data-target='#exampleModalLong'>";
					html += dp.dpName;
					html += "</button>";
					html += "<td>" + dp.dpDesc + "</td>";
					html += "<td>" + dp.cnt + "</td>";
					html += "</tr>";
				}
				$("#departTbody").html(html);
			},
			error : function(err){
				console.log(err);
			}
		})
	})
	function showPop(dpNum){
		var p = {dpNum:dpNum};
		p = JSON.stringify(p);

		$.ajax({
			url : '/user/list',
			data : 'cmd=list&param=' + encodeURIComponent(p),
			dataType : 'json',
			success : function(res){
				$('.pop').show();
				var html =""
				for(var idx in res){
					var user = res[idx];
					html += "<tr>";
					html += "<td>" + user.num + "</td>";
					html += "<td>" + user.name + "</td>";
					html += "<td>" + user.id + "</td>";
					html += "<td>" + user.pwd + "</td>";
					html += "<td>" + user.trans + "</td>";
					html += "<td>" + user.hobby + "</td>";
					html += "<td>" + user.address + "</td>";
					html += "</tr>";
				}
				$("#user_tbody").html(html);
			},
			error : function(err){
				console.log(err);
			}
		})
	}
</script>	
</body>
</html>
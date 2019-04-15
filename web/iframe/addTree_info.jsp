<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>添加木材信息</title>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<style type="text/css">
table,table tr th,table tr td {
	border: 1px solid #8e8e8e;
}

table {
	width: 100%;
	font-size: 12px;
	color: #333333;
	border-collapse: collapse;
	text-align: left;
}

th,td {
	padding: 3px;
	border-bottom: 1px solid #bbb;
	padding: 10px;
}

th {
	text-align: left;
	color: #666666;
}

thead tr {
	font-size: 14px;
	height: 58px;
	color: #666;
	background-color: #ECECEC;
	border: none;
}

thead th:hover {
	background-color: #D4E0F2;
}

.textInput {
	width: 150px;
	height: 20px;
	border: 1px solid #58805f;
	line-height: 21px;
}

select option {
	background-color: #D4E0F2;
}

.submitButton {
	width: 10%;
	height: 30px;
	margin-top: 20px;
	margin-left: 186px;
	font-size: 12px;
	font-weight: bold;
	border: 2px solid #D4E0F2;
	border-right-color: #58805f;
	border-bottom-color: #58805f;
	background-color: #D4E0F2;
	color: #666666;
}
</style>
</head>
<body style="margin-top:0px;">
	<form action="../AddTreeInfoServlet" enctype="multipart/form-data" method="post">
		<table border="1" cellspacing="0">
			<thead>
				<tr>
					<th align="center" colspan="2">添加木材信息</th>
				</tr>
				<tr>
					<th>编号：</th>
					<td><input type="text" id="id" name="id" class="textInput">
					</td>
				</tr>
				<tr>
					<th>名称：</th>
					<td><input type="text" id="name" name="name" class="textInput">
					</td>
				</tr>
				<tr>
					<th>拉丁文名：</th>
					<td><input type="text" id="latin" name="latin"
						class="textInput">
					</td>
				</tr>
				<tr>
					<th>别称：</th>
					<td><input type="text" id="another" name="another"
						class="textInput">
					</td>
				</tr>
				<tr>
					<th>属性：</th>
					<td><input type="text" id="classify" name="classify"
						class="textInput">
					</td>
				</tr>
				<tr>
					<th>树干图:</th>
					<td><input type="file" name="trunk" id="trunk"
						style="border: 0px; font-size: 10px;" />
					</td>
				</tr>
				<tr>
					<th>叶子图:</th>
					<td><input type="file" name="leaf" id="leaf"
						style="border: 0px; font-size: 10px;" />
					</td>
				</tr>
				<tr>
					<th>花朵图:</th>
					<td><input type="file" name="flower" id="flower"
						style="border: 0px; font-size: 10px;" />
					</td>
				</tr>
				<tr>
					<th>种子图:</th>
					<td><input type="file" name="seed" id="seed"
						style="border: 0px; font-size: 10px;" />
					</td>
				</tr>
				<tr>
					<th>横截面微观图:</th>
					<td><input type="file" name="cro" id="cro"
						style="border: 0px; font-size: 10px;" />
					</td>
				</tr>
				<tr>
					<th>弦切面微观图:</th>
					<td><input type="file" name="chord" id="chord"
						style="border: 0px; font-size: 10px;" />
					</td>
				</tr>
			</tbody>
		</table>
		<input type="button" id="submitData" name="submit" value="提交"
			class="submitButton" onclick="submitDate()" />
	</form>
</body>
</html>
<!--  在这里采用js将数据提交到后台，通过表单项的数据处理将图片数据和文本数据分离 -->
<script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript">
	var submitDate = function() {
		document.getElementById("submitData").disabled = true;
		// 树干图
		var trunkImg = document.getElementById("trunk").files[0];
		// 叶子图
		var leafImg = document.getElementById("leaf").files[0];
		// 花朵图
		var flowerImg = document.getElementById("leaf").files[0];
		// 种子图
		var seedImg = document.getElementById("seed").files[0];
		// 横截面微观图
		var croImg = document.getElementById("cro").files[0];
		// 弦切面微观图
		var chordImg = document.getElementById("chord").files[0];

		var formData = new FormData();
		formData.append("trunkImg", trunkImg);
		formData.append("leafImg", leafImg);
		formData.append("seedImg", seedImg);
		formData.append("croImg", croImg);
		formData.append("chordImg", chordImg);

		formData.append("id", $("#id").val());
		formData.append("name", $("#name").val());
		formData.append("another", $("#another").val());
		formData.append("classify", $("#classify").val());

		// 封装数据
		$.ajax({
			type : "POST",
			url : "/Tree/addTreeInfoServlet",
			dataType : "json",
			cache : false, //不设置缓存
			processData : false, // 不处理数据
			contentType : false, // 不设置内容类型
			data : formData,
			success : function(response) {
				if (response.status === 200) {
					// 数据提交成功,跳转回列表页面
					window.location.href = "/Tree/iframe/Tree_info.jsp";
					document.getElementById("submitData").disabled = false;
				}
			},
			error : function(xhr) {
				console.log("错误提示： " + xhr + " ---- " + xhr.status + " "
						+ xhr.statusText);
				alert("数据提交出错！");
				document.getElementById("submitData").disabled = false;

			},
			//请求完成后回调函数 (请求成功或失败之后均调用)。参数： XMLHttpRequest 对象和一个描述成功请求类型的字符串
			complete : function(XMLHttpRequest, textStatus) {
				console.log("函数调用完成，将按钮设置为可用状态");
				document.getElementById("submitData").disabled = false;
			}
		});
	};
</script>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<jsp:include page="header.jsp" >
  <jsp:param name="title" value="決済確認画面" />
</jsp:include>
    <div id="container">
		<div id="page-title">
		 <h1>Settlement Confirm</h1>
		 <p>宛先選択</p>
	  　</div>
	<s:if test="#session.destinationInfoDTOList.size > 0">
		<div id="top">
			<h2>宛先情報を選択してください。</h2>
		</div>

		<s:form id="form" action="SettlementCompleteAction">
		<div id="nep-parallel-table">
		<table>
			<thead>
				<tr>
					<th><s:label value="#"/></th>
					<th><s:label value="姓"/></th>
					<th><s:label value="名"/></th>
					<th><s:label value="ふりがな"/></th>
					<th><s:label value="住所"/></th>
					<th><s:label value="電話番号"/></th>
					<th><s:label value="メールアドレス"/></th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="#session.destinationInfoDTOList" status="st">
				<tr>
					<td class="center">
						<span>
						<s:if test="#st.index == 0">
							<input type="radio" name="id" checked="checked" value="<s:property value='id'/>"/>
						</s:if>
						<s:else>
							<input type="radio" name="id" value="<s:property value='id'/>"/>
						</s:else>
						</span>
					</td>
					<td>
						<span><s:property value="familyName"/></span>
					</td>
					<td>
						<span><s:property value="firstName"/></span>
					</td>
					<td>
						<span><s:property value="familyNameKana"/><s:property value="firstNameKana"/></span>
					</td>
					<td>
						<span><s:property value="userAddress"/></span>
					</td>
					<td>
						<span><s:property value="telNumber"/></span>
					</td>
					<td>
						<span><s:property value="email"/></span>
					</td>
				</tr>
				</s:iterator>
			</tbody>
		</table>
		</div>

		<div id="submit">
			<div id="submit-btn">
				<s:submit value="決済" class="submit_btn"/>
			</div>
		</div>


		</s:form>
	</s:if>
	<!-- 宛先情報が存在しなければ以下を表示 -->
	<s:else>
	<div id="other">
		<div class="other-box">
			<p>宛先情報がありません。</p>
		</div>
	</div>
	</s:else>
			<div id="submit">
				<div id="submit-btn">
					<s:form action="CreateDestinationAction" style="height:100%;">
						<s:submit value="新規宛先登録" class="submit_btn"/>
					</s:form>
				</div>
		</div>
   </div>
</body>
</html>
<%@ page import="com.glory.entity.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.glory.entity.Group" %>
<%@ page import="java.security.Guard" %>
<%@ page import="com.glory.entity.Role" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@include file="/WEB-INF/views/public.jsp"%>

<section id="content_wrapper">
    <div id="topbar">
        <div class="topbar-left">
            <ol class="breadcrumb">
                <li class="crumb-active"><a href="#">人员列表</a></li>
                <li class="crumb-icon"><a href="/"><span class="glyphicon glyphicon-home"></span></a></li>
                <li class="crumb-link"><a href="/">首页</a></li>
            </ol>
        </div>
    </div>
    <div id="content">
        <div class="row">
            <div class="col-md-12">
                <div class="panel">
                    <div class="panel-heading"><span class="panel-title"> <span
                            class="glyphicons glyphicons-keys"></span> 人员列表 </span></div>
                    <div class="panel-body">
                        <table class="table table-hover">
                            <thead>
                            <th style="width:1%" nowrap=""></th>
                            <%--<th style="width:1%" nowrap="">ID</th>--%>
                            <th style="width:1%" nowrap="">呢称</th>
                            <th style="text-align: left;width:1%" nowrap="">Email</th>
                            <%--<th style="width:1%" nowrap="">分组</th>--%>
                            <%--<th style="width:1%" nowrap="">角色</th>--%>
                            <%--<th style="width:1%" nowrap="">审批项目管理员账号</th>--%>
                            <th style="width:1%" nowrap="">创建时间</th>
                            <th style="width:1%" nowrap="">操作</th>
                            </thead>

                            <tbody>
                            <%
                                List<User> myGroup = (List<User>) request.getAttribute("myGroup");
                                if (myGroup != null) {
                                    for (int i = 0; i < myGroup.size(); i++) {
                                        User myGroupItem = myGroup.get(i);

                            %>

                            <tr>
                                <td nowrap="" class="small"><%= i + 1%><img src="" width="50"/></td>
                                <%--<td nowrap="" class="small"><%= myGroupItem.getId() %><img src="" width="50"/></td>--%>
                                <td class="small"><%= myGroupItem.getUsername() %>
                                </td>
                                <td class="small"><%= myGroupItem.getEamil()%>
                                </td>



                                <td nowrap class="small"><%= myGroupItem.getCreateAt()%>
                                </td>
                                <td nowrap>
                                    <%--<button type="button" class="btn btn-default btn-xs editBtn" data-id="<%= myGroupItem.getId()%>">编辑</button>--%>
                                    <button type="button" class="btn btn-default btn-xs deleteBtn"
                                            data-id="<%= myGroupItem.getId()%>">移出小组
                                    </button>
                                </td>
                            </tr>

                            <%
                                    }
                                }
                            %>

                            </tbody>
                        </table>

                        <div>
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>
</section>


</div>
<!-- End #Main -->
<!-- jQuery -->
<script src="/resources/jquery/jquery-3.2.1.js"></script>
<script src="/resources/jquery/jquery_ui/jquery-ui.min.js"></script>
<script src="/resources/bootstrap-3.3.7/js/bootstrap.js"></script>


<!-- Page Plugins -->
<script src="/resources/js/main.js"></script>


<script type="text/javascript">
    jQuery(document).ready(function () {

        $('.editBtn').click(function () {

            $('.btn').attr('disabled','disabled');
            var id = $(this).attr("data-id");
            var groupId = $('#group_' + id).val();
            var roleId = $('#role_' + id).val();
            if (confirm("确定编辑人员")){
                $.ajax('/User/EditForm', {
                    data: {
                        id: id,
                        groupId: groupId,
                        roleId: roleId
                    },
                    type: 'post',
                    datype: 'JSON',
                    success: function (data) {
                        if (data.code == 0) {
                            alert("编辑成功")
                            location.replace("/User/List")
                        } else {
                            alert("编辑失败")
                        }
                    },
                    error: function () {

                    }

                })
            }

        })



        $('.deleteBtn').click(function () {

            var id = $(this).attr("data-id");

            alert(id)

//            $.ajax('/User/DeleteForm', {
//                data: {
//                    id: id,
//                },
//                type: 'post',
//                datype: 'json',
//                success: function (data) {
//                    if (data.code == 0) {
//
//                        location.replace("/User/List")
//                    } else {
//                        alert("删除失败")
//                    }
//                },
//                error: function () {
//                    alert("删除失败")
//                }
//
//            });
        });
        Core.init();
    });
</script>

</body>

</html>
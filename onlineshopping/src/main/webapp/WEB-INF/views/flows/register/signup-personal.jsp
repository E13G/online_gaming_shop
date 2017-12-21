<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../shared/flow-header.jsp" %>


<div class="container" style="margin-top: 60px;">
    <br>
    <div class="row">
        <div class="col-xs-12 col-md-12">
            <div class="offset-md-2 col-md-8">
                <div class="card">
                    <div class="card-header card-title text-center">
                        <h4>Sign Up - Personal Info</h4>
                    </div>
                    <form:form class="form-horizontal" id="registerForm" method="post" modelAttribute="user">
                        <div class="card-body">

                            <!-- FORM Elements -->


                            <div class="form-group row">
                                <label class="control-label col-md-4" for="firstName">First Name: </label>
                                <div class="col-md-8">
                                    <form:input type="text" path="firstName" placeholder="Nome"
                                                class="form-control"/>
                                    <form:errors path="firstName" cssClass="help-block" element="em"/>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="control-label col-md-4" for="lastName">Last Name: </label>
                                <div class="col-md-8">
                                    <form:input type="text" path="lastName" placeholder="Apelido"
                                                class="form-control"/>
                                    <form:errors path="lastName" cssClass="help-block" element="em"/>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="control-label col-md-4" for="email">Email: </label>
                                <div class="col-md-8">
                                    <form:input type="text" path="email" placeholder="****@****"
                                                class="form-control"/>
                                    <form:errors path="email" cssClass="help-block errHighlight" element="em"/>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="control-label col-md-4" for="contact_number">Contact Number: </label>
                                <div class="col-md-8">
                                    <form:input type="text" path="contactNumber"
                                                placeholder="xxxxxxxxx" class="form-control"/>
                                    <form:errors path="contactNumber" cssClass="help-block"
                                                 element="em"/>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="control-label col-md-4" for="password">Password: </label>
                                <div class="col-md-8">
                                    <form:input type="password" path="password" placeholder="Password"
                                                class="form-control"/>
                                    <form:errors path="password" cssClass="help-block" element="em"/>
                                </div>
                            </div>
                            
                            <div class="form-group row">
                                <label class="control-label col-md-4" for="confirmPassword"> Confirm Password: </label>
                                <div class="col-md-8">
                                    <form:input type="password" path="confirmPassword" placeholder="Re-Enter Password"
                                                class="form-control"/>
                                    <form:errors path="confirmPassword" cssClass="help-block" element="em"/>
                                </div>
                            </div>
                           
                        </div>
                        <!-- Submit -->
                        <div class="col-md-12 text-center card-footer">
                            <!-- This name is important -->
                            <button type="submit" name="_eventId_billing"
                                    class="btn btn-primary">
                                 Next - Billing Address  
                            </button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>


<%@ include file="../shared/flow-footer.jsp" %>
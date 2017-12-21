<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="../shared/flow-header.jsp" %>

<div class="container" style="margin-top: 50px;">
    <br>
    <div class="row">
        <div class="col-xs-12 col-md-12">
            <div class="offset-md-2 col-md-8">
                <div class="card">
                    <div class="card-header card-title text-center">
                        <h4>Sign Up - Billing Address</h4>
                    </div>
                    <form:form class="form-horizontal" id="registerForm" method="POST" modelAttribute="billing">
                        <div class="card-body">

                            <!-- FORM Elements -->

                            <div class="form-group row">
                                <label class="control-label col-md-4" for="addressLineOne"> Address: </label>
                                <div class="col-md-8">
                                    <form:input type="text" path="addressLineOne" placeholder="Address"
                                                class="form-control"/>
                                    <form:errors path="addressLineOne" cssClass="help-block" element="em"/>
                                </div>
                            </div>


                            <div class="form-group row">
                                <label class="control-label col-md-4" for="city"> City: </label>
                                <div class="col-md-8">
                                    <form:input type="text" path="city" placeholder=" City "
                                                class="form-control"/>
                                    <form:errors path="city" cssClass="help-block" element="em"/>
                                </div>
                            </div>
                            
                            <div class="form-group row">
                                <label class="control-label col-md-4" for="state">State:  </label>
                                <div class="col-md-8">
                                    <form:input type="text" path="state" placeholder=" State "
                                                class="form-control"/>
                                   
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="control-label col-md-4" for="country">Country:  </label>
                                <div class="col-md-8">
                                    <form:input type="text" path="country" placeholder=" Country "
                                                class="form-control"/>
                                    <form:errors path="country" cssClass="help-block errHighlight" element="em"/>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="control-label col-md-4" for="postalCode">Postal Code: </label>
                                <div class="col-md-8">
                                    <form:input type="text" path="postalCode"
                                                placeholder="XXXX-XXX" class="form-control"/>
                                    <form:errors path="postalCode" cssClass="help-block"
                                                 element="em"/>
                                </div>
                            </div>
                        </div>
                        <!-- Submit -->
                        <div class="col-md-12 text-center card-footer">
                            <!-- This name is important -->
                            <button type="submit" name="_eventId_personal"
                                    class="btn btn-primary">
                                <i class='fa fa-arrow-left fa-lg' aria-hidden='true'></i>Previous - Personal Info 
                            </button>
                            <button type="submit" name="_eventId_confirm"
                                    class="btn btn-primary">
                                <i class='fa fa-arrow-right fa-lg' aria-hidden='true'></i> Next - Confirm
                            </button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

<%@include file="../shared/flow-footer.jsp" %>
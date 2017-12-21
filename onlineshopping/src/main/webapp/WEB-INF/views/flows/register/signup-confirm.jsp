
<%@include file="../shared/flow-header.jsp" %>

	<div class="container" style="margin-top: 60px;">

    <div class="row">
        <!-- columns for Display The personal details -->
        <div class="col-xs-12 col-md-12">
            <div class="card">
                <div class="card-deck card-body">
                    <div class="card ">
                        <div class="card-header card-title ">
                            <h4>Personal Info</h4>
                        </div>

                        <div class="card-body">
                           <h4>${registerModel.user.firstName} ${registerModel.user.lastName}</h4>
                           <hr/>
                           <dl class="row">
                               
                            	<dt class="col-sm-5"> E-mail: </dt> 
                            	<dd class="col-sm-7"> ${registerModel.user.email}</dd>
                            	
                            	<dt class="col-sm-5"> Contact-Number: </dt> 
                            	<dd class="col-sm-7"> ${registerModel.user.contactNumber}</dd>
                            </dl>
                        </div>
                        <div class="card-footer">
                            <a href="${flowExecutionUrl }&_eventId_personal"
                               class="btn btn-primary">Personal</a>
                        </div>
                    </div>


                    <!-- column for Display the address -->
                    <div class="card">
                        <div class="card-header card-title">
                            <h4>Billing Address</h4>
                        </div>

                        <div class="card-body">
                            <dl class="row">
                            	<dt class="col-sm-4"> Address: </dt> 
                            	<dd class="col-sm-8"> ${registerModel.billing.addressLineOne}</dd>
                            	
                            	<dt class="col-sm-4"> Postal-Code: </dt> 
                            	<dd class="col-sm-8"> ${registerModel.billing.postalCode}</dd>
                            	
                            	<dt class="col-sm-4"> City: </dt> 
                            	<dd class="col-sm-8"> ${registerModel.billing.city}</dd>
                            	
                            	<dt class="col-sm-4"> State: </dt> 
                            	<dd class="col-sm-8"> ${registerModel.billing.state}</dd>
                            	
                            	<dt class="col-sm-4"> Country: </dt> 
                            	<dd class="col-sm-8"> ${registerModel.billing.country}</dd>
                            </dl>
                        </div>
                        <div class="card-footer">
                            <a href="${flowExecutionUrl }&_eventId_billing"
                               class="btn btn-primary">Edit </a>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 text-center card-footer">
                    <a href="${flowExecutionUrl }&_eventId_submit"
                       class="btn btn-primary btn-lg">Confirm</a>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="../shared/flow-footer.jsp" %>
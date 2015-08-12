<#--Adding Member Modal -->
<form name="dataForm" id="dataForm" action="saveProjectHistory.erp" method="POST">
    <div class="modal fade" id="projectHistoryCreateModal" tabindex="-1" role="dialog" aria-labelledby="basicModal"
        aria-hidden="true">

        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title"> Creating Project History </h4>
                </div>
                <div class="modal-body" id="teamModal">
                    <div class="row">
                        <div class="col-lg-4 text-left">
                            Project/File No:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <input class="form-control" type="text"
                                       value="${project.fileNo}" disabled/>
                            </div>
                        </div>
                        <input type="hidden" name="fileNo" value="${project.fileNo}"/>

                        <div class="col-lg-4 text-left">
                            Note / History :
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <textarea name="historyNote" id="historyNote" class="form-control"
                                          rows="3"></textarea>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Discard</button>
                    <button type="submit" class="btn btn-primary">Save</button>
                </div>
            </div>
        </div>
    </div>
</form>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:html>
    <t:head>
        <!-- jQuery DataTables -->
        <link rel="stylesheet" type="text/css" href="resources/css/datatables.min.css">
        <script type="text/javascript" charset="utf8" src="resources/js/datatables.min.js"></script>

        <script type="text/javascript">
            $( document ).ready(function() {
                $("button").click(function() {
                    if( $.trim($('#projectDir').val()).length === 0 ) {
                        $('#projectDir').addClass('invalid');
                    }
                    else {
                        $.get( "ajax/overview/list", { "projectDir": $('#projectDir').val() } )
                        .done(function( data ) {
                            $('#overviewTable').DataTable( {
                                data: data,
                                columns: [
                                    { title: "Page Identifier", data: "pageId" },
                                    { title: "Preprocessed", data: "preprocessed" },
                                    { title: "Segmented", data: "segmented" },
                                    { title: "Segments Extracted", data: "segmentsExtracted" },
                                    { title: "Lines Extracted", data: "linesExtracted" },
                                    { title: "Has GT", data: "hasGT" },
                                ]
                            });
                        })
                        .fail(function( data ) {
                            // TODO: error handling
                            console.log(data);
                        })
                    }
                });
            });
        </script>

        <title>OCR4all_Web - Overview</title>
    </t:head>
    <t:body>
        <div class="container">
            <h3 class="header">Overview</h3>
            <div class="row">
                <div class="input-field col s8">
                    <i class="material-icons prefix">folder</i>
                    <input id="projectDir" name="projectDir" type="text" class="validate">
                    <label for="projectDir" data-error="Not a valid directory path">Please insert the path to the project directory on the filesystem</label>
                </div>
                <div class="input-field col s4">
                    <button class="btn waves-effect waves-light" type="submit" name="action">Go
                        <i class="material-icons right">send</i>
                    </button>
                </div>
            </div>
        </div>
        <div class="container">
            <table id="overviewTable" class="display" width="100%"></table>
        </div>
    </t:body>
</t:html>
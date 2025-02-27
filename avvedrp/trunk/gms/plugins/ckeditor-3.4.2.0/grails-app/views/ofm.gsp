<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />

        <title>File Manager</title>

		<link rel="stylesheet" type="text/css" href="${resource(dir: 'js/ofm/styles', file:'reset.css', plugin: 'ckeditor')}" />
		<link rel="stylesheet" type="text/css" href="${resource(dir: 'js/ofm/scripts/jquery.filetree', file:'jqueryFileTree.css', plugin: 'ckeditor')}" />
		<link rel="stylesheet" type="text/css" href="${resource(dir: 'js/ofm/scripts/jquery.contextmenu', file:'jquery.contextMenu.css', plugin: 'ckeditor')}" />
		<link rel="stylesheet" type="text/css" href="${resource(dir: 'js/ofm/styles', file:'filemanager.css', plugin: 'ckeditor')}" />
		<!--[if IE]>
		<link rel="stylesheet" type="text/css" href="${resource(dir: 'js/ofm/styles', file:'ie.css', plugin: 'ckeditor')}" />
		<![endif]-->

        <script type="text/javascript" src="${resource(dir: 'js/ofm/scripts', file:'jquery-1.2.6.min.js', plugin: 'ckeditor')}"></script>

        <script type="text/javascript">
            var ofmBase ="${resource(dir: 'js/ofm', plugin: 'ckeditor')}";
            var culture = '${ofm.currentLocale()}';
            var autoload = true;
            var showFullPath = false;
            var fileRoot = '/';
            var treeConnector = '${params.treeConnector}';
            var fileConnector = '${params.fileConnector}';
            var tmp = '${params.showThumbs}';
            var showThumbs = (tmp == '' ? false : eval(tmp));
            var space = '${params.space}';
            var type = '${params.type}';
            var webRoot = '${ofm.baseUrl(space: params.space, type: params.type)}';
        </script>
	</head>

    <body>
        <div>
            <form id="uploader" method="post">
                <h1></h1>
                <button id="gotoroot" name="gotoroot" type="button" value="Go to root"></button>
                <div id="uploadresponse"></div>
                <input id="mode" name="mode" type="hidden" value="add" />
                <input id="currentpath" name="currentpath" type="hidden" />
                <input id="newfile" name="newfile" type="file" />
                <button id="upload" name="upload" type="submit" value="Upload"></button>
                <button id="newfolder" name="newfolder" type="button" value="New Folder"></button>
                <button id="grid" class="ON" type="button">&nbsp;</button><button id="list" type="button">&nbsp;</button>
            </form>

            <div id="splitter">
                <div id="filetree"></div>
                <div id="fileinfo"><h1></h1></div>
            </div>

            <ul id="itemOptions" class="contextMenu">
                <li class="select"><a href="#select"></a></li>
                <li class="download"><a href="#download"></a></li>
                <li class="rename"><a href="#rename"></a></li>
                <li class="delete separator"><a href="#delete"></a></li>
            </ul>
        </div>

        <script type="text/javascript" src="${resource(dir: 'js/ofm/scripts', file:'jquery.form.js', plugin: 'ckeditor')}"></script>
        <script type="text/javascript" src="${resource(dir: 'js/ofm/scripts/jquery.splitter', file:'jquery.splitter.js', plugin: 'ckeditor')}"></script>
        <script type="text/javascript" src="${resource(dir: 'js/ofm/scripts/jquery.filetree', file:'jqueryFileTree.js', plugin: 'ckeditor')}"></script>
        <script type="text/javascript" src="${resource(dir: 'js/ofm/scripts/jquery.contextmenu', file:'jquery.contextMenu.js', plugin: 'ckeditor')}"></script>
        <script type="text/javascript" src="${resource(dir: 'js/ofm/scripts', file:'jquery.impromptu-1.5.js', plugin: 'ckeditor')}"></script>
        <script type="text/javascript" src="${resource(dir: 'js/ofm/scripts', file:'jquery.tablesorter.min.js', plugin: 'ckeditor')}"></script>
        <script type="text/javascript" src="${resource(dir: 'js/ofm/scripts', file:'filemanager.js', plugin: 'ckeditor')}"></script>
    </body>
</html>
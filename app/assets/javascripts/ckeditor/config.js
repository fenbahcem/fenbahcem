if (typeof(CKEDITOR) != 'undefined') {
            CKEDITOR.editorConfig = function( config )
            {
	   config.extraPlugins = 'youtube';
           config.width = '100%'; 
	config.filebrowserImageBrowseLinkUrl = "/ckeditor/pictures";
  config.filebrowserImageBrowseUrl = "/ckeditor/pictures";
  config.filebrowserImageUploadUrl = "/ckeditor/pictures";	
config.enterMode = CKEDITOR.ENTER_BR;
   config.shiftEnterMode = CKEDITOR.ENTER_BR;
   config.autoParagraph = false;
  }
}


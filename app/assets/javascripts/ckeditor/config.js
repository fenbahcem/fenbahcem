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
						config.toolbar_mini = [
							    ["Bold",  "Italic",  "Underline",  "Strike",  "-",  "Subscript",  "Superscript", "Image", "Link", 
										"Cut", "Copy", "Paste", "Table", "NumberedList", "BulletedList", "Outdent", "Indent", "Styles",
									"Format", "TextColor","BGColor", "JustifyLeft","JustifyCenter","JustifyRight"],
							  ];
					
  }
}


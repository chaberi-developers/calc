$('#input').attr('maxlength','300');
var textLength = $('<span>');
textLength.attr('id','text-length');
textLength.text('残り210文字');
$('.textInput').append(textLength);

var cssStyle = $('<style>');
cssStyle.text('#text-length{color:#999;font-size:14px; padding:10px 10px 10px 350px;}  #text-length.lengthOver{color:#C00;}');
$('head').append(cssStyle);

$('#input').keyup(function(){
    var now =210-$('#input').val().length;
    if(now < 0 ){
    var nowSubstring = String(now).substring(1);
    $('#text-length').addClass('lengthOver');
    $('#text-length').text(nowSubstring+ '文字オーバー');
    $('input[alt="発言する"]').prop('disabled',true);
    }else{    
    $('#text-length').removeClass('lengthOver');
    $('#text-length').text('残り'+ now +'文字');
    $('input[alt="発言する"]').prop('disabled',false);
    }
})
$('input[alt="発言する"]').click(function(){
    now =210-$('#input').val().length;
    $('#text-length').text('残り'+ now +'文字');
})




/* dekireba adoon ka sitai firefox chrome 
$('div#messageFrame').css("height", "800px");
$('div#chatContent').css("height", "800px");
*/ 




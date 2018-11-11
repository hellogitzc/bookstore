$(function () {
    var $allCheckbox = $('input[type="checkbox"]'),     //全局的全部checkbox
        $wholeChexbox = $('#all'),//全选
        $sonCheckBox = $('#son');
	
    //===============================================全局全选与单个商品的关系================================
    $wholeChexbox.click(function () {
        var $checkboxs = $cartBox.find('input[type="checkbox"]');
        if ($(this).is(':checked')) {
            $checkboxs.prop("checked", true);
            
        } else {
            $checkboxs.prop("checked", false);
            
        }
        totalMoney();
    });
    
    $sonCheckBox.each(function () {
        $(this).click(function () {
            if ($(this).is(':checked')) {
                //判断：所有单个商品是否勾选
                var len = $sonCheckBox.length;
                var num = 0;
                $sonCheckBox.each(function () {
                    if ($(this).is(':checked')) {
                        num++;
                    }
                });
                if (num == len) {
                    $wholeChexbox.prop("checked", true);
                    
                }
            } else {
                //单个商品取消勾选，全局全选取消勾选
                $wholeChexbox.prop("checked", false);
               
            }
        })
    })
    
    
    //=================================================商品数量==============================================
    var $plus = $('.add1'),
        $reduce = $('.jian1'),
        $all_sum = $('.sum');
    $plus.click(function () {
        var $inputVal = $(this).prev('input'),
            $count = parseInt($inputVal.val())+1,
            $obj = $(this).parents('.gwc_num').find('.jian1'),
            $priceTotalObj = $(this).parents('.sub_content').find('#sum'),//小计
            $price = $(this).parents('.sub_content').find('#price').html(),  //单价
            $priceTotal = $count*parseInt($price.substring(1));
        $inputVal.val($count);
        $priceTotalObj.html('￥'+$priceTotal);
        
        totalMoney();
    });
    
    $reduce.click(function () {
    	  var $inputVal = $(this).next('input'),
          $count = parseInt($inputVal.val())-1,
          
          $priceTotalObj = parseInt($(this).parents('.content2').find('#sum')),//小计
          $price = $(this).parents('.content2').find('#price').html(),  //单价
          $priceTotal = $count*parseInt($price.substring(1));
    	  if($inputVal.val()>1){
              $inputVal.val($count);
              $priceTotalObj.html('￥'+$priceTotal);
          }
        totalMoney();
    });
   
    $all_sum.keyup(function () {
        var $count = 0,
            $priceTotalObj = $(this).parents('.content2').find('#sum'),
            $price = $(this).parents('.content2').find('#price').html(),  //单价
            $priceTotal = 0;
        if($(this).val()==''){
            $(this).val('1');
        }
        $(this).val($(this).val().replace(/\D|^0/g,''));
        $count = $(this).val();
        $priceTotal = $count*parseInt($price.substring(1));
        $(this).attr('value',$count);
        $priceTotalObj.html('￥'+$priceTotal);
        totalMoney();
    })
    
    //======================================总计==========================================

    function totalMoney() {
        var total_money = 0;
        var total_count = 0;
        var calBtn = $('.jiesuanjiage fl');
        $sonCheckBox.each(function () {
            if ($(this).is(':checked')) {
                var goods = parseInt($(this).parents('.content2').html().substring(1));
                var num =  parseInt($(this).parents('.content2').find('.numb').val());
                total_money += goods;
                total_count += num;
            }
        });
        $('#total_text').html('￥'+total_money);
        $('#piece_num').html(total_count);

        console.log(total_money,total_count);
    }
       
    
});
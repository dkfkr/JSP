/**
 * 
 */
$(function(){
    $('.showPopup').click(function(e){
        e.preventDefault();
        
        const tr = $(this).parent().parent();
        const orderProduct = tr.find('.orderProduct').text();
        const thumb = tr.find('.thumb1').text();
        const receiver = tr.find('.receiver').text();
        const address  = tr.find('.address').text();
        const pName = tr.find('.pName').text();
        const price = tr.find('.price').text();
        const count = tr.find('.count').text();
        const delivery = tr.find('.delivery').text();
        const total = tr.find('.total').text();
        const orderer = tr.find('.orderer').text();
        const date = tr.find('.date').text();
        const etc = tr.find('.etc').text();
        
        const popup = $('#orderPopup');
        popup.find('.orderProduct').text(orderProduct);
        popup.find('.thumb > img').attr('src', '/Farmstory2/thumb/'+thumb);
        popup.find('.receiver').text(receiver);
        popup.find('.address').text(address);
        popup.find('.pName').text(pName);
        popup.find('.price').text(price);
        popup.find('.count').text(count);
        popup.find('.delivery').text(delivery);
        popup.find('.total').text(total);
        popup.find('.orderer').text(orderer);
        popup.find('.date').text(date);
        popup.find('.etc').text(etc);
        popup.show();
    });

    $('#orderPopup .btnClose').click(function(){
        $('#orderPopup').hide();
    });

});



$(function(){
    $('.showPopup').click(function(e){
        e.preventDefault();
        
        const tr = $(this).parent().parent();
        const uid = tr.find('.uid').text();
        const name = tr.find('.name').text();
        const nick = tr.find('.nick').text();
        const email  = tr.find('.email').text();
        const hp = tr.find('.hp').text();
        const grade = tr.find('.grade').text();
        const regDate = tr.find('.regDate').text();
        const regIp = tr.find('.regIp').text();
        const addr1 = tr.find('.addr1').text();
        const addr2 = tr.find('.addr2').text();

        
        const popup = $('#userPopup');
        popup.find('.uid').text(uid);
        popup.find('.name').text(name);
        popup.find('.nick').text(nick);
        popup.find('.email').text(email);
        popup.find('.hp').text(hp);
        popup.find('.grade').text(grade);
        popup.find('.regDate').text(regDate);
        popup.find('.regIp').text(regIp);
        popup.find('.addr1').text(addr1);
        popup.find('.addr2').text(addr2);
        popup.show();
    });
    
    $('#userPopup .btnClose').click(function(){
        $('#userPopup').hide();
    });

});
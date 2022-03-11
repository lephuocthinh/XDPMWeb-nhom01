Câu 1:
- Mục tiêu: Thiết kế web datatable và dữ liệu được lấy từ DOM
- Cách cài đặt và sử dụng:
	* Sử dụng:
	+ Dùng bookstrap để xây dựng khuôn mẫu cho trang web
	+ Dữ liệu được lấy từ địa chỉ mockapi.io 
		"url:'https://6214b1f689fad53b1f1bb0e1.mockapi.io/banhcuon/',type:'get',dataType:'json',"
	+ Hàm F1 gọi địa chỉ để tìm kiếm và lấy data về show lên trang web
		function F1()
	{
		$.ajax({
           url:'https://6214b1f689fad53b1f1bb0e1.mockapi.io/banhcuon/',type:'get',dataType:'json',
           success:function(dataReturn){
               console.log(dataReturn);
               $('#result1').html('');
               $.each(dataReturn,function(k,v){
                   var s=`<div class="banhcuon">
                        ${v.id} - ${v.name} <hr>
                        <img src="${v.image}">
                    </div>`;
                        $('#result1').append(s);
               });
           } 
        })
	}
	* Cách cài đặt:
	+ Tải gói bookstrap <script src='jquery-3.6.0.min.js'></script>
	+ Truy cập mockapi.io để tạo tài khoản. Sau đó tạo 1 database tự động và gắn địa chỉ vào web.
	
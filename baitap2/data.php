<?php
   //Kết nối dữ liệu từ database
   include 'util.php';

   // Đọc các giá trị gửi đến từ Ajax
   $draw = $_POST['draw'];
   $row = $_POST['start'];
   $rowperpage = $_POST['length']; // Số dòng mỗi trang
   $columnIndex = $_POST['order'][0]['column']; // Cột đánh chỉ số
   $columnName = $_POST['columns'][$columnIndex]['data']; // Cột tên
   $columnSortOrder = $_POST['order'][0]['dir']; // Sắp xếp asc / desc
   $search = $_POST['search']['value']; // Từ khóa tìm kiếm

   $searchArray = array();

   // Tìm kiếm
   $searchQuery = " ";
   if($search != ''){
      $searchQuery = " AND (tensanpham LIKE :tensanpham ) ";
      $searchArray = array( 
           'tensanpham'=>"%$search%",
      );
   }

   // Tổng số dữ liệu khi chưa có lọc tìm kiếm
   $stmt = $conn->prepare("SELECT COUNT(*) AS allcount FROM sanpham ");
   $stmt->execute();
   $records = $stmt->fetch();
   $totalRecords = $records['allcount'];

   // Tổng số dữ liệu khi có lọc tìm kiếm
   $stmt = $conn->prepare("SELECT COUNT(*) AS allcount FROM sanpham WHERE 1 ".$searchQuery);
   $stmt->execute($searchArray);
   $records = $stmt->fetch();
   $totalRecordwithFilter = $records['allcount'];

   // Lấy dữ liệu
   $stmt = $conn->prepare("SELECT * FROM sanpham WHERE 1 ".$searchQuery." ORDER BY ".$columnName." ".$columnSortOrder." LIMIT :limit,:offset");

   // Ràng buộc giá trị
   foreach ($searchArray as $key=>$search) {
      $stmt->bindValue(':'.$key, $search,PDO::PARAM_STR);
   }

   $stmt->bindValue(':limit', (int)$row, PDO::PARAM_INT);
   $stmt->bindValue(':offset', (int)$rowperpage, PDO::PARAM_INT);
   $stmt->execute();
   $empRecords = $stmt->fetchAll();

   $data = array();

   foreach ($empRecords as $row) {
      $data[] = array(
         "id_sp"=>$row['id_sp'],
         "tensanpham"=>$row['tensanpham'],
         "hinh"=>$row['hinh'],
         "gia"=>$row['gia'],
         "id_danhmuc"=>$row['id_danhmuc']
      );
   }

   // Kết quả trả về
   $response = array(
      "draw" => intval($draw),
      "iTotalRecords" => $totalRecords,
      "iTotalDisplayRecords" => $totalRecordwithFilter,
      "aaData" => $data
   );

   echo json_encode($response);
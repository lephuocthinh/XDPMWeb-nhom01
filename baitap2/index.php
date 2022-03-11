<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Datatable</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script type="text/javascript" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $('#datatable').DataTable({
                'processing': true,
                'serverSide': true,
                'serverMethod': 'post',
                'ajax': {
                    'url':'data.php'
                },
                'columns': [
                    { data: 'id_sp' },
                    { data: 'tensanpham'},
                   {data: 'hinh'},
                { data: 'gia' },
                ]
           });

        } );
    </script>
</head>
<body style="background-color: pink">
    <div class="container mt-5" ba>
        <h2 style="margin-bottom: 40px;">Bài Tập 2</h2>
        <table id="datatable" class="display" style="width:100%">
            <thead>
                <tr>
                    <th style="width: 100px;">Mã Sản Phẩm</th>
                    <th style="width: 200px;">Tên Sản Phẩm</th>
                    <th> Hình </th>
                    <th>Giá</th>
                </tr>
            </thead>
        </table>
    </div>
</body>
</html>
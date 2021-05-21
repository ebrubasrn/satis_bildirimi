<%@ page import="java.util.Date" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-9"
         pageEncoding="ISO-8859-9"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link href='select2/dist/css/select2.min.css' rel='stylesheet' type='text/css'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Satýþ Bildirimi</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="./vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="./vendor/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="./vendor/datatables/datatables.css">
    <!-- Fontastic Custom icon font-->
    <link rel="stylesheet" href="./css/fontastic.css">
    <!-- Google fonts - Poppins -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="./css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="./css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/favicon.ico">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
    <link rel="stylesheet" href="dist/sweetalert2.css">
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
    <style>

        tr{cursor: pointer; transition: all .25s ease-in-out}
        .selected{background-color: #ff0000; font-weight: bold; color: #fff;}

    </style>
</head>
<body onload="addDate();">

<div class="page">
    <!-- Main Navbar-->
    <header class="header">
        <nav class="navbar">

            <div class="container-fluid">
                <div class="navbar-holder d-flex align-items-center justify-content-between">
                    <!-- Navbar Header-->
                    <div class="navbar-header">
                        <!-- Navbar Brand --><a href="index.html" class="navbar-brand d-none d-sm-inline-block">
                        <div class="brand-text d-none d-lg-inline-block"><strong>TMO</strong></div>
                        <div class="brand-text d-none d-sm-inline-block d-lg-none"><strong>BD</strong></div>
                    </a>
                        <!-- Toggle Button--><a id="toggle-btn" href="#" class="menu-btn active"><span></span><span></span><span></span></a>
                    </div>
                    <!-- Navbar Menu -->
                    <ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">

                        <!-- Logout    -->
                        <li class="nav-item"><a href="/logout" class="nav-link logout"> <span class="d-none d-sm-inline">Çýkýþ</span><i class="fa fa-sign-out"></i></a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
    <div class="page-content d-flex align-items-stretch ">
        <!-- Forms Section-->

            <div class="container-fluid" style="padding-top:30px">
                <div class="row">

                    <div class="col-lg-2">
                        <div class="card">
                            <div class="card-header d-flex align-items-center">
                                <h3 class="h4">Satýþ Tarihleri</h3>
                            </div>
                            <div class="card-body">
                                <table class="datatable table table-striped table-bordered">
                                    <thead>
                                    <tr>
                                        <th scope="col">Satýþ Tarihi</th>

                                    </tr>
                                    </thead>
                                    <tbody>

                                    <c:if test="${ not empty tarihList }">
                                        <c:forEach items="${tarihList}" var="item">
                                            <tr >
                                                <td>
                                                    <a href="/getSatisList/${item.tarih}">${item.tarih} </a></td>

                                            </tr>
                                        </c:forEach>
                                    </c:if>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>


                    <div class="col-lg-10">
                        <div class="card">

                            <div class="card-header d-flex align-items-center">
                                <h3 class="h4">Satýþ Listesi</h3>
                            </div>
                            <div class="card-body">

                                <div class="table-responsive">
                                    <table class="datatable table table-striped table-bordered" id="tablom" >
                                        <thead>
                                        <tr>
                                            <th scope="col">Tarih</th>
                                            <th scope="col">Firma Adý</th>
                                            <th scope="col">Baþvuru Þubesi</th>
                                            <th scope="col">Tes. Þubesi</th>
                                            <th scope="col">Kodu</th>
                                            <th scope="col">Satýþ Þekli</th>
                                            <th scope="col">Günlük Yatan</th>
                                            <th scope="col">Önceki Yatan</th>
                                            <th scope="col">Top. Yatan</th>
                                            <th scope="col">Günlük Teslimat</th>
                                            <th scope="col">Top. Teslimat</th>
                                            <th scope="col">Bakiye</th>
                                            <th scope="col">Düzenle</th>
                                            <th scope="col">Sil</th>


                                        </tr>
                                        </thead>
                                        <tbody>

                                        <c:if test="${ not empty satisList }">
                                            <c:forEach items="${satisList}" var="satisl">
                                                <tr>
                                                    <td>${satisl.tarih}</td>
                                                    <td>${satisl.firma.firmaAdi}</td>
                                                    <td>${satisl.basvuruSube.subeAdi}</td>
                                                    <td>${satisl.teslimatSube.subeAdi}</td>
                                                    <td>${satisl.urun.urunKodu}</td>
                                                    <td>${satisl.satisSekli.satisSekli}</td>
                                                    <td>${satisl.gunlukYatan}</td>
                                                    <td>${satisl.oncekiYatan}</td>
                                                    <td>${satisl.toplamYatan}</td>
                                                    <td>${satisl.gunlukTeslimat}</td>
                                                    <td>${satisl.toplamTeslimat}</td>
                                                    <td>${satisl.teslimatYapilacak}</td>
                                                    <td><a href="/getSatisById/${satisl.satisId}" class="btn btn-sm btn-primary">Düzenle</a></td>
                                                    <td><a href="/satisSil/${satisl.satisId}" class="btn btn-danger btn-sm">Sil</a></td>
                                                </tr>
                                            </c:forEach>
                                        </c:if>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header d-flex align-items-center">
                                <h3 class="h4">Satýþ Bildirimi Formu</h3>
                            </div>
                            <div class="card-body ">
                                <c:if test = "${kayit=='1'}">
                                    <script>ClearFields();</script>
                                </c:if>
                                <form  class="form-validate" action="/satisKayit" method="post" autocomplete="off" >
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <label class="form-control-label">Tarih</label>

                                            <c:choose>
                                                <c:when test="${ not empty satis }">
                                                    <input name="tarih" class="form-control" placeholder="${satis.tarih}" />
                                                    <input name="satisId" class="form-control" value="${satis.satisId}" hidden />

                                                </c:when>
                                                <c:otherwise>
                                                    <input  name="tarih" class="form-control" placeholder="Tarih" />

                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <div class="col-lg-6">
                                            <label class="form-control-label">Satýþ Þekli</label>
                                            <select name="satisSekli" class="form-control" required>
                                                <option value="">-- Satýþ Þekli --</option>
                                                <c:choose>
                                                    <c:when test="${ not empty satis }">
                                                        <c:forEach items="${satisSekliList}" var="satisSekli">
                                                            <option value="${satisSekli.sid}" ${satisSekli.sid == satis.satisSekli.sid ? 'selected=' : ''}>${satisSekli.satisSekli}</option>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>

                                                        <c:if test="${ not empty satisSekliList }">
                                                            <c:forEach items="${satisSekliList}" var="satisSekli">
                                                                <option value=${satisSekli.sid}>${satisSekli.satisSekli}</option>
                                                            </c:forEach>
                                                        </c:if>
                                                    </c:otherwise>
                                                </c:choose>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <label class="form-control-label">Ýþlem</label>
                                            <input placeholder="Ýþlem" name="islem" value="SATIÞ" class="form-control" readonly>
                                        </div>
                                        <div class="col-lg-6">
                                            <label class="form-control-label">Günlük Yatan</label>

                                            <c:choose>
                                                <c:when test="${ not empty satis }">
                                                    <input type="number" placeholder="Günlük Yatan" name="gunlukYatan" class="form-control" onblur="ToplamYatanHesapla()">
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="number" placeholder="Günlük Yatan" name="gunlukYatan" class="form-control" required onblur="ToplamYatanHesapla();">
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <label class="form-control-label">Faaliyet Alaný</label>

                                            <select name="faaliyetAlani" class="form-control" required>
                                                <option value="">-- Faaliyet Alaný --</option>
                                                <c:choose>
                                                    <c:when test="${ not empty satis }">
                                                        <c:forEach items="${faaliyetAlaniList}" var="faaliyet">
                                                            <option value="${faaliyet.fid}" ${faaliyet.fid == satis.faaliyetAlani.fid ? 'selected=' : ''}>${faaliyet.faaliyetAlani}</option>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>

                                                        <c:if test="${ not empty faaliyetAlaniList }">
                                                            <c:forEach items="${faaliyetAlaniList}" var="faaliyet">
                                                                <option value=${faaliyet.fid}>${faaliyet.faaliyetAlani}</option>
                                                            </c:forEach>
                                                        </c:if>
                                                    </c:otherwise>
                                                </c:choose>



                                            </select>
                                        </div>
                                        <div class="col-lg-6">
                                            <label class="form-control-label">Önceki Yatan</label>
                                            <c:choose>
                                                <c:when test="${ not empty satis }">

                                                    <c:set var="toplam" value="${0}" />
                                                        <c:set var="toplam" value="${ satis.gunlukYatan + satis.oncekiYatan}" />

                                                    <input type="number" value="${toplam}" name="oncekiYatan" class="form-control" readonly>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="number" placeholder="Önceki Yatan" name="oncekiYatan" class="form-control" readonly>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <label class="form-control-label">Firma Adý</label>
                                            <select name="firma" class="form-control" required>
                                                <option value="">-- Firma --</option>
                                                <c:choose>
                                                    <c:when test="${ not empty satis }">
                                                        <c:forEach items="${firmaList}" var="firma">
                                                            <option value=${firma.firmaId} ${firma.firmaId == satis.firma.firmaId ? 'selected=' : ''}>${firma.firmaNo}-${firma.firmaAdi}</option>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>

                                                        <c:if test="${ not empty firmaList }">
                                                            <c:forEach items="${firmaList}" var="firma">
                                                                <option value=${firma.firmaId}>${firma.firmaNo}-${firma.firmaAdi}</option>
                                                            </c:forEach>
                                                        </c:if>
                                                    </c:otherwise>
                                                </c:choose>
                                            </select>
                                        </div>
                                        <div class="col-lg-6">
                                            <label class="form-control-label">Toplam Yatan</label>

                                            <c:choose>
                                                <c:when test="${ not empty satis }">
                                                    <input type="number" value="${satis.toplamYatan}" name="toplamYatan" class="form-control" readonly>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="number" placeholder="Toplam Yatan" name="toplamYatan" class="form-control" readonly>
                                                </c:otherwise>
                                            </c:choose>

                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <label class="form-control-label">Baþvuru Þubesi</label>
                                            <select name="basvuruSube" class="form-control" required>
                                                <option value="">-- Baþvuru Þubesi --</option>
                                                <c:choose>
                                                    <c:when test="${ not empty satis }">
                                                        <c:forEach items="${subeList}" var="sube">
                                                            <option value="${sube.subeId}" ${sube.subeId == satis.basvuruSube.subeId ? 'selected=' : ''}>${sube.subeAdi}</option>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>

                                                        <c:if test="${ not empty subeList }">
                                                            <c:forEach items="${subeList}" var="sube">
                                                                <option value=${sube.subeId}>${sube.subeAdi}</option>
                                                            </c:forEach>
                                                        </c:if>
                                                    </c:otherwise>
                                                </c:choose>
                                            </select>
                                        </div>
                                        <div class="col-lg-6">
                                            <label class="form-control-label">Günlük Teslimat</label>
                                            <c:choose>
                                                <c:when test="${ not empty satis }">
                                                    <input type="number"  name="gunlukTeslimat" class="form-control" onblur="ToplamTeslimatHesapla()">
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="number" placeholder="gunlukTeslimat" name="gunlukTeslimat" class="form-control" onblur="ToplamTeslimatHesapla()">
                                                </c:otherwise>
                                            </c:choose>

                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <label class="form-control-label">Teslimat Þubesi</label>
                                            <input value="${kullanici.personel.sube.subeId}" name="teslimatSube" class="form-control" hidden>
                                            <input value="${kullanici.personel.sube.subeAdi}" name="teslimatSubeAdi" class="form-control" disabled>
                                        </div>
                                        <div class="col-lg-6">
                                            <label class="form-control-label">Toplam Teslimat</label>
                                            <c:choose>
                                                <c:when test="${ not empty satis }">
                                                    <input type="number" value="${satis.toplamTeslimat}" name="toplamTeslimat" class="form-control" readonly>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="number" placeholder="Toplam Teslimat" name="toplamTeslimat" class="form-control" readonly>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <label class="form-control-label">Ürün Kodu</label>
                                            <select name="urun" class="form-control" required>
                                                <option value="">-- Ürün Kodu --</option>
                                                <c:choose>
                                                    <c:when test="${ not empty satis }">
                                                        <c:forEach items="${urunList}" var="urun">
                                                            <option value="${urun.urunId}" ${urun.urunId == satis.urun.urunId ? 'selected=' : ''}>${urun.urunKodu}-${urun.urunAdi}</option>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>

                                                        <c:if test="${ not empty urunList }">
                                                            <c:forEach items="${urunList}" var="urun">
                                                                <option value=${urun.urunId}>${urun.urunKodu}-${urun.urunAdi}</option>
                                                            </c:forEach>
                                                        </c:if>
                                                    </c:otherwise>
                                                </c:choose>
                                            </select>
                                        </div>
                                        <div class="col-lg-6">
                                            <label class="form-control-label">Teslimat Yapýlacak</label>


                                            <c:choose>
                                                <c:when test="${ not empty satis }">
                                                    <input type="number" value="${satis.teslimatYapilacak}" name="teslimatYapilacak" class="form-control" readonly>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="number" placeholder="Teslimat Yapýlacak" id="tbteslimatYapilacak" name="teslimatYapilacak" class="form-control" readonly>
                                                </c:otherwise>
                                            </c:choose>

                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12" style="text-align:right; margin-top:20px">
                                            <input  value="Ýptal" onclick="ClearFields();" class="btn btn-secondary">
                                            <button type="submit" class="btn btn-primary">Kaydet</button>
                                        </div>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

    </div>
</div>


<script src='js/jquery-3.2.1.min.js' type='text/javascript'></script>
<script src='select2/dist/js/select2.min.js' type='text/javascript'></script>
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/popper.js/umd/popper.min.js"> </script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
<script src="vendor/chart.js/Chart.min.js"></script>
<script src="vendor/jquery-validation/jquery.validate.min.js"></script>
<script src="vendor/datatables/datatables.js"></script>
<!-- Main File-->
<script src="js/front.js"></script>

<script src="dist/sweetalert2.all.min.js"></script>
<script src="dist/sweetalert2.min.js"></script>

<script>
    function ToplamYatanHesapla(){
        var gunlukYatan =$("input[name='gunlukYatan']").val();
        var oncekiYatan =$("input[name='oncekiYatan']").val();
        if(oncekiYatan!="")
        $("input[name='toplamYatan']").val(parseInt(gunlukYatan)+parseInt(oncekiYatan));
        else
            $("input[name='toplamYatan']").val(gunlukYatan);
        ToplamTeslimatHesapla();
    }
    const toplamTeslimatIlk = $("input[name='toplamTeslimat']").val();
    function ToplamTeslimatHesapla(){
        var gunlukTeslimat =$("input[name='gunlukTeslimat']").val();
        var toplamTeslimat;
        //const toplamTeslimatIlk =$("input[name='toplamTeslimat']").val();
        var toplamYatan =$("input[name='toplamYatan']").val();
        if(gunlukTeslimat=="")
            gunlukTeslimat="0";
        if(toplamTeslimatIlk=="")
            toplamTeslimat="0";
        else
            toplamTeslimat=parseInt(toplamTeslimatIlk);
        if(toplamYatan=="")
            toplamYatan="0";
        $("input[name='toplamTeslimat']").val(parseInt(gunlukTeslimat) + parseInt(toplamTeslimat));
        $("input[name='teslimatYapilacak']").val(parseInt(toplamYatan)-parseInt(toplamTeslimat)-parseInt(gunlukTeslimat));

    }
    function ClearFields()
    {
        $("input[name='satisId']").val("");
        $("input[name='gunlukYatan']").val("");
        $("select[name='faaliyetAlani']").val("NONE");
        $("select[name='firma']").val("NONE");
        $("input[name='oncekiYatan']").val("");
        $("input[name='toplamYatan']").val("");
        $("select[name='basvuruSube']").val("NONE");
        $("select[name='satisSekli']").val("NONE");
        $("input[name='gunlukTeslimat']").val("");
        $("input[name='toplamTeslimat']").val("");
        $("select[name='urun']").val("NONE");
        $("input[name='teslimatYapilacak']").val("");

    }


    function addDate(){
        date = new Date();
        var month = date.getMonth()+1;
        var day = date.getDate();
        var year = date.getFullYear();

        $("input[name='tarih']").val(year+'-0'+month+'-'+day);


    }

    $(document).ready(function () {
        $('#tablom').dataTable({
            responsive: false,
            "pagingType": "full_numbers",
            "language": { "url": "./vendor/datatables/Turkish.json" }
        });
    });
    function selectedRow(){

        var index,
            table = document.getElementById("tablom");

        for(var i = 1; i < table.rows.length; i++)
        {
            table.rows[i].onclick = function()
            {
                // remove the background from the previous selected row
                if(typeof index !== "undefined"){
                    table.rows[index].classList.toggle("selected");
                }
                console.log(typeof index);
                // get the selected row index
                index = this.rowIndex;
                // add class selected to the row
                this.classList.toggle("selected");
                console.log(typeof index);
            };
        }

    }
    selectedRow();
</script>
<script>
    if ('${kayit}'==1)
        Swal.fire({
            icon: 'success',
            title: 'Kaydedildi...'
        });
    else if('${kayit}'==2)
        Swal.fire({
            icon: 'error',
            title: 'Kaydetme Baþarýsýz...'
        });
    if ('${sil}'==1)
        Swal.fire({
            icon: 'success',
            title: 'Kayýt silindi...'
        });
    else if('${sil}'==2)
        Swal.fire({
            icon: 'error',
            title: 'Kayýt Silinemedi'
        });
</script>

</body>
</html>
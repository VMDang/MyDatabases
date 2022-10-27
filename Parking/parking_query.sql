-- Cau 1:  Thong ke so luong xe chug cua moi ho
select ID_ho, count(ID_chu_xe) as slxe_ho
from chu_xe
group by ID_ho
having count(chu_xe.ID_chu_xe) > 10
order by slxe_ho desc
limit 10;
 
 -- Cau 2: Cho biet so luong moi luoi xe cua ho gia dinh
 select ho_gia_dinh.ID_ho,thong_tin_xe.Loai_xe, count(thong_tin_xe.Loai_xe) as sl_moi_loai
 from ho_gia_dinh,chu_xe,thong_tin_xe
 where ho_gia_dinh.ID_ho = chu_xe.ID_ho
 and chu_xe.ID_chu_xe = thong_tin_xe.ID_chu_xe
 group by Loai_xe,ID_ho
 order by ID_ho;
 
 -- Cau 3: Thong ke so luong xe ngoai chung cu dang gui, tinh te le phan tram so voi tong so xe
select thong_tin_xe.Loai_xe,count(thong_tin_xe.Loai_xe) as slxe_khach,
(count(thong_tin_xe.Loai_xe)*100)/(select count(*) from thong_tin_xe) as percent_all
from the,thong_tin_xe
where the.ID_xe = thong_tin_xe.ID_xe 
and thong_tin_xe.ID_chu_xe is null
group by Loai_xe;

-- Cau 4: Cho biet nguoi dang gui xe su dung loai ve nao 
select thong_tin_xe.Loai_xe,Hang_xe,Bien_so_xe,
case 
	when the.ID_the like 'M%' THEN 'Ve thang'
    when the.ID_the like 'D%' THEN 'Ve Ngay' 
    when the.ID_the like 'T%' THEN 'Ve Dem' 
    ELSE 'Khong co ve'
end as Loai_ve
from thong_tin_xe,the
where thong_tin_xe.ID_xe = the.ID_xe;

-- Cau 5: Tim kiem thong tin chu nhan va chiec se theo hang voi cacs chu cai tu A->D
select chu_xe.ten_chu_xe,sdt,thong_tin_xe.Hang_xe,Loai_xe,Bien_so_xe
from chu_xe,thong_tin_xe
where  chu_xe.ID_chu_xe = thong_tin_xe.ID_chu_xe
and ( ascii(Hang_xe) >= 65 and ascii(Hang_xe) <= 68)
order by Hang_xe;

-- Cau 6: Tim kiem nhung xe gui truoc 16:32:55 s
select thong_tin_xe.Loai_xe,Hang_xe,Bien_so_xe,thoi_gian_gui_va_lay_xe.Thoi_gian,Trang_thai
from thong_tin_xe,the,thoi_gian_gui_va_lay_xe
where (thong_tin_xe.ID_xe = the.ID_xe and the.ID_the = thoi_gian_gui_va_lay_xe.ID_the)
and (thoi_gian_gui_va_lay_xe.Thoi_gian < '2022-07-28 16:32:52' and Trang_thai= 'gui');

-- Cau 7: Tinh tong so tien thu theo ngay voi cac xe dang ki ve ngay
select thong_tin_xe.Loai_xe, sum(gia_ve) as Thu_theo_ngay
from (thong_tin_xe left join gia_ve
on thong_tin_xe.Loai_xe = gia_ve.Loai_xe ),thong_tin_gui
where thong_tin_xe.ID_xe = thong_tin_gui.ID_xe
and thong_tin_gui.ID_the like 'D%'
and gia_ve.ID_gia like 'D%'
group by thong_tin_xe.Loai_xe;


-- Cau 8: Dua ra gia ve va thong tin cua cac xe gui sau 16:32:52
select thong_tin_xe.Loai_xe,Hang_xe,Bien_so_xe,Gia_ve.gia_ve,thoi_gian_gui_va_lay_xe.Thoi_gian,Trang_thai
from (thong_tin_xe left join gia_ve
on thong_tin_xe.Loai_xe = gia_ve.Loai_xe)
left join the on thong_tin_xe.ID_xe = the.ID_xe 
left join thoi_gian_gui_va_lay_xe on the.ID_the = thoi_gian_gui_va_lay_xe.ID_the
where thong_tin_xe.ID_chu_xe is null
and gia_ve.ID_gia like 'D%'
and (thoi_gian_gui_va_lay_xe.Thoi_gian >= '2022-07-28 16:32:52' and Trang_thai= 'gui') ;

-- Cau 9: Top 5 ho gia dinh co tien ve thang cao nhat

select ho_gia_dinh.ID_ho, sum(gia_ve) as ve_thang_hogd
from (thong_tin_xe left join gia_ve
on thong_tin_xe.Loai_xe = gia_ve.Loai_xe) 
left join chu_xe on thong_tin_xe.ID_chu_xe = chu_xe.ID_chu_xe
left join the on chu_xe.ID_chu_xe = the.ID_chu_xe, ho_gia_dinh
where ho_gia_dinh.ID_ho = chu_xe.ID_ho 
and thong_tin_xe.ID_chu_xe is not null
and gia_ve.ID_gia like 'M%'
and the.ID_the like 'M%'
group by ho_gia_dinh.ID_ho
order by ve_thang_hogd desc
limit 5;

-- Cau 10: Tim kiem thong tin ca nhan cua cac ho co ve thang cao nhat

select sum_tab.ID_ho,chu_xe.ID_chu_xe,Ten_chu_xe,SDT
from (
	select ho_gia_dinh.ID_ho, sum(gia_ve) as tong_tien
	from (thong_tin_xe left join gia_ve
	on thong_tin_xe.Loai_xe = gia_ve.Loai_xe) 
	left join chu_xe on thong_tin_xe.ID_chu_xe = chu_xe.ID_chu_xe
	left join the on chu_xe.ID_chu_xe = the.ID_chu_xe, ho_gia_dinh
	where ho_gia_dinh.ID_ho = chu_xe.ID_ho 
	and thong_tin_xe.ID_chu_xe is not null
	and gia_ve.ID_gia like 'M%'
	and the.ID_the like 'M%'
	group by ho_gia_dinh.ID_ho
	order by tong_tien desc 
    limit 2
) as sum_tab left join chu_xe on sum_tab.ID_ho = chu_xe.ID_ho
where chu_xe.ID_ho is not null;

package com.works.satis_bildirimi.repositories;

import com.works.satis_bildirimi.models.Satis;
import com.works.satis_bildirimi.models.SatisTarih;
import com.works.satis_bildirimi.models.Sube;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Optional;

public interface SatisRepository extends JpaRepository<Satis,Integer> {
    @Query("SELECT DISTINCT new com.works.satis_bildirimi.models.SatisTarih (s.tarih) " +
            "FROM Satis s where s.teslimatSube.subeId = :#{#teslimatSube.subeId}")
    List<SatisTarih> GetDistinctSatisTarih(@Param("teslimatSube") Sube teslimatSube);



    /*

    @Query("SELECT DISTINCT new com.works.satis_bildirimi.models.SatisTarih (s.tarih) " +
            "FROM Satis s where s.teslimatSube.subeId=? ")
    List<SatisTarih> GetDistinctSatisTarih();

     */

    List<Satis> findByTarih(LocalDate date);
    List<Satis> findByTarihAndTeslimatSube(LocalDate date, Sube teslimatSube);
}

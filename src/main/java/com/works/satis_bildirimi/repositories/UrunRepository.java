package com.works.satis_bildirimi.repositories;

import com.works.satis_bildirimi.models.Urun;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UrunRepository extends JpaRepository<Urun,Integer> {
}

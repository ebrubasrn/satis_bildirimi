package com.works.satis_bildirimi.repositories;

import com.works.satis_bildirimi.models.Kullanici;
import com.works.satis_bildirimi.models.Personel;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface KullaniciRepository extends JpaRepository<Kullanici,Integer> {
    Optional<Kullanici> findBySicilNoAndPassword (String sicilNo, String password);
}

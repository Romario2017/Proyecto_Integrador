package com.veterinaria.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.veterinaria.entity.Mascota;

public interface MascotaRepository extends JpaRepository<Mascota, Integer>{
	
	@Query("Select m from Mascota m where m.nombre_mascota like :param_mascota")
	public abstract List<Mascota> listaMascotaPorNombre(@Param("param_mascota") String nombre_mascota);
}

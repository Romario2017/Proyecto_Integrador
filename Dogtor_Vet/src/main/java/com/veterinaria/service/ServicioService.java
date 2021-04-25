package com.veterinaria.service;

import java.util.List;
import java.util.Optional;

import com.veterinaria.entity.Servicio;

public interface ServicioService {
	public abstract Servicio insertaServicio(Servicio objServicio);
	public abstract List<Servicio> listaServicio();
	public abstract Optional<Servicio> obtienePorId(Integer codigo_servicio);
	public abstract void eliminaServicio(Integer codigo_servicio);
	public abstract List<Servicio> listaServicioPorNombreLike(String nombre_servicio);
}

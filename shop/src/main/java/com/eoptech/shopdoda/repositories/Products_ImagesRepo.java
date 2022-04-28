package com.eoptech.shopdoda.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.eoptech.shopdoda.entities.ProductsImages;

@Repository
public interface Products_ImagesRepo extends JpaRepository<ProductsImages, Integer>{

}

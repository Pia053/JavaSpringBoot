package com.example.ass_sof3021_ph19850.repository;

import com.example.ass_sof3021_ph19850.entity.Account;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface IAccountRepository extends JpaRepository<Account, String> {

    @Query("Select entity From Account entity Where entity.tenDangNhap = :tenDangNhap")
    Account findByTenDangNhap(@Param("tenDangNhap") String tenDangNhap);

    @Query(value = "" +
            "Select MAX(CONVERT(INT,SUBSTRING(ma_account,5,100))) " +
            "From account", nativeQuery = true)
    String genMaAccount();
}

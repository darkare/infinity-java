package com.dfong.security.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.dfong.security.entity.UserRole;

@Repository
public interface UserRoleRepository extends CrudRepository<UserRole, Integer> {
//	@Query("select a.role_type from party_user pu, user_role ur where pu.user_permission_id = ur.user_role_id")
//    public String findRoleByUsername (Integer userRoleId);
}

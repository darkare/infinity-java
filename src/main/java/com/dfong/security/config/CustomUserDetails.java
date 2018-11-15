package com.dfong.security.config;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;

import com.dfong.security.entity.PartyUser;

public class CustomUserDetails extends PartyUser implements UserDetails {

	
	public CustomUserDetails (PartyUser pu ) {
		super(pu);
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		
		//return AuthorityUtils.commaSeparatedStringToAuthorityList("ROLE_USER");
		System.out.println("Role:" + getUserRole().getRoleType());
		return AuthorityUtils.createAuthorityList(this.getUserRole().getRoleType());
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {

		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

	@Override
	public String getUsername() {
		return super.getUsername();
	}

}

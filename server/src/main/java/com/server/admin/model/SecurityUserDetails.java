package com.server.admin.model;

import com.server.admin.entity.UserEntity;
import lombok.Builder;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;

import static java.util.List.of;

@RequiredArgsConstructor
@Builder
public class SecurityUserDetails implements UserDetails {

    private static final String ROLE_PREFIX = "ROLE_";

    private final String email;
    private final String password;
    private final GrantedAuthority grantedAuthority;

    public SecurityUserDetails(UserEntity userEntity) {
        this.email = userEntity.getEmail();
        this.password = userEntity.getPassword();
        this.grantedAuthority = new SimpleGrantedAuthority(ROLE_PREFIX + userEntity.getRole());
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return of(this.grantedAuthority);
    }

    @Override
    public String getPassword() {
        return password;
    }

    @Override
    public String getUsername() {
        return email;
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
}

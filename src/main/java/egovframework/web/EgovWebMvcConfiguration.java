package egovframework.web;

import com.kepco.app.core.interceptor.MenuInterceptor;
import com.kepco.app.core.interceptor.RootMenuInterceptor;
import com.kepco.app.core.interceptor.SettingInterceptor;
import com.kepco.app.core.interceptor.UserMenuInterceptor;
import com.kepco.app.domain.accesslog.mapper.AccessLogMapper;
import com.kepco.app.domain.bbs.service.BbsRoleService;
import com.kepco.app.domain.bbs.service.BbsRoleSysService;
import com.kepco.app.domain.menu.mapper.MenuSysMapper;
import com.kepco.app.domain.setting.service.SettingSysService;
import com.navercorp.lucy.security.xss.servletfilter.XssEscapeServletFilter;
import egovframework.cmmn.web.EgovBindingInitializer;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.http.CacheControl;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import java.util.concurrent.TimeUnit;

@RequiredArgsConstructor
@Configuration
public class EgovWebMvcConfiguration implements WebMvcConfigurer {

	private final MenuSysMapper menuSysMapper;

	private final AccessLogMapper accessLogMapper;

	private final SettingSysService settingSysService;

	private final BbsRoleService bbsRoleService;

	private final BbsRoleSysService bbsRoleSysService;

	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/cmmn/validator.do").setViewName("cmmn/validator");
		registry.addViewController("/").setViewName("forward:/index.jsp");
		registry.setOrder(Ordered.HIGHEST_PRECEDENCE);
	}

	@Bean
	public UrlBasedViewResolver urlBasedViewResolver() {
		UrlBasedViewResolver urlBasedViewResolver = new UrlBasedViewResolver();
		urlBasedViewResolver.setOrder(1);
		urlBasedViewResolver.setViewClass(JstlView.class);
		urlBasedViewResolver.setPrefix("/WEB-INF/jsp/vasanta/");
		urlBasedViewResolver.setSuffix(".jsp");
		return urlBasedViewResolver;
	}

	@Bean
    public SessionLocaleResolver localeResolver() {
        return new SessionLocaleResolver();
    }

	@Bean
    public LocaleChangeInterceptor localeChangeInterceptor() {
        LocaleChangeInterceptor interceptor = new LocaleChangeInterceptor();
        interceptor.setParamName("lang");
        return interceptor;
    }

	@Bean
	public MenuInterceptor menuInterceptor() {
		return new MenuInterceptor(menuSysMapper, accessLogMapper);
	}

	@Bean
	public RootMenuInterceptor rootMenuInterceptor() {
		return new RootMenuInterceptor(menuSysMapper);
	}

	@Bean
	public UserMenuInterceptor userMenuInterceptor() {
		return new UserMenuInterceptor(menuSysMapper);
	}

	@Bean
	public SettingInterceptor settingInterceptor() {
		return new SettingInterceptor(settingSysService);
	}

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(localeChangeInterceptor());

		registry.addInterceptor(menuInterceptor())
				.addPathPatterns("/sys/**")
				.excludePathPatterns("/sys/assets/**", "/sys/css/**", "/sys/fonts/**", "/sys/js/**", "/js/**", "/jstree/**")
				.excludePathPatterns("/api/**/*")
				.excludePathPatterns("/file/**/*")
				.excludePathPatterns("/sys/login", "/sys/logout", "/api/sys/login")
				.excludePathPatterns("/actuator/**", "/swagger-ui/**");
		
		registry.addInterceptor(rootMenuInterceptor()).addPathPatterns("/index", "/pop/search/all/**");

		registry.addInterceptor(userMenuInterceptor())
				.addPathPatterns("/mber/**")
				.excludePathPatterns("/mber/css/**", "/mber/js/**", "/mber/assets/**", "/mber/fonts/**")
				.excludePathPatterns("/api/**/login", "/mber/**/logout")
				.excludePathPatterns("/actuator/**", "/swagger-ui/**");

//		registry.addInterceptor(settingInterceptor())
//				.addPathPatterns("/**")
//				.excludePathPatterns("/mber/css/**", "/mber/js/**", "/mber/assets/**", "/mber/fonts/**")
//				.excludePathPatterns("/api/**/*", "/mber/**/logout");
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {

		registry.addResourceHandler("/**").addResourceLocations("/")
				.setCacheControl(CacheControl.maxAge(1, TimeUnit.DAYS));

		// Swagger UI 리소스를 제공할 리소스 핸들러 설정
		registry.addResourceHandler("/swagger-ui/**")
				.addResourceLocations("classpath:/META-INF/resources/webjars/swagger-ui/");

		// Swagger UI HTML 파일을 위한 경로 설정
		registry.addResourceHandler("/swagger-ui.html")
				.addResourceLocations("classpath:/META-INF/resources/");
    }

	/**
	 * CharacterEncodingFilter
	 * @return
	 */
	@Bean
	public FilterRegistrationBean<CharacterEncodingFilter> encodingFilterBean() {
		FilterRegistrationBean<CharacterEncodingFilter> registrationBean = new FilterRegistrationBean<>();
		CharacterEncodingFilter filter = new CharacterEncodingFilter();
		filter.setForceEncoding(true);
		filter.setEncoding("UTF-8");
		registrationBean.setFilter(filter);
		registrationBean.addUrlPatterns("/*");
		registrationBean.setOrder(1);
		return registrationBean;
	}

	/**
	 * Naver Lucy-Xss-Servlet Filter
	 * @return
	 */
	@Bean
	public FilterRegistrationBean<XssEscapeServletFilter> xssEscapeServletFilterBean() {
		FilterRegistrationBean<XssEscapeServletFilter> filterRegistrationBean = new FilterRegistrationBean<>();
		filterRegistrationBean.setFilter(new XssEscapeServletFilter());
		filterRegistrationBean.addUrlPatterns("/*");
		filterRegistrationBean.setOrder(2);
		return filterRegistrationBean;
	}

}

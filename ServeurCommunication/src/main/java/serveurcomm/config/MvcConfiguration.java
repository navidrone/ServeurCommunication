package serveurcomm.config;


import javax.annotation.PostConstruct;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import serveurcomm.service.ServeurDrone;


@Configuration
@ComponentScan(basePackages="serveurcomm")
@EnableWebMvc
@EnableTransactionManagement
public class MvcConfiguration extends WebMvcConfigurerAdapter{

	@Bean
	public ViewResolver getViewResolver(){
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		return resolver;
	}
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
		registry.addResourceHandler("/images/**").addResourceLocations("/resources/images");
	}
	
	
//	@Bean(name = "dataSource")
//	public DataSource getDataSource() {
//		BasicDataSource dataSource = new BasicDataSource();
//		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
//		dataSource.setUrl("jdbc:mysql://localhost:3306/navidrone");
//		dataSource.setUsername("root");
//		dataSource.setPassword("root");
//	 
//		return dataSource;
//	}
//	
//	private Properties getHibernateProperties() {
//    	Properties properties = new Properties();
//    	properties.put("hibernate.show_sql", "true");
//    	properties.put("hibernate.dialect", "org.hibernate.dialect.MySQLDialect");
//    	return properties;
//    }
//	
//	@Autowired
//	@Bean(name = "sessionFactory")
//	public SessionFactory getSessionFactory(DataSource dataSource) {
//	 
//		LocalSessionFactoryBuilder sessionBuilder = new LocalSessionFactoryBuilder(dataSource);
//	 
//		sessionBuilder.addAnnotatedClasses(Utilisateur.class);
//		sessionBuilder.addAnnotatedClasses(CoordGps.class);
//		sessionBuilder.addAnnotatedClasses(Mission.class);
//	 
//		return sessionBuilder.buildSessionFactory();
//	}	
//	
//	@Autowired
//	@Bean(name = "transactionManager")
//	public HibernateTransactionManager getTransactionManager(
//			SessionFactory sessionFactory) {
//		HibernateTransactionManager transactionManager = new HibernateTransactionManager(
//				sessionFactory);
//		return transactionManager;
//	}
//	
//	
//	@Autowired
//	@Bean(name = "utilisateurDao")
//	public UtilisateurDAO getUtilisateurDao(SessionFactory sessionFactory) {
//		return new UtilisateurDAO(sessionFactory);
//	}
//	
//	
//	@Autowired
//	@Bean(name = "coordGpsDao")
//	public CoordGpsDAO getCoordonneeGpsDAO(SessionFactory sessionFactory) {
//		return new CoordGpsDAO(sessionFactory);
//	}
//	
//	@Autowired
//	@Bean(name = "missionDao")
//	public MissionDAO getMissionDAO(SessionFactory sessionFactory) {
//		return new MissionDAO(sessionFactory);
//	}



	@PostConstruct
	public void demarrerServeurDrone() {
		Thread thread = new Thread(new ServeurDrone(5050));
		thread.start();
	}
	
}

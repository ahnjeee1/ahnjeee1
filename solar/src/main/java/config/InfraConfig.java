package config;

import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.dao.annotation.PersistenceExceptionTranslationPostProcessor;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBean;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;



@Configuration
@EnableTransactionManagement
// @PropertySource("file:${SOLAR_CONFIG}")
public class InfraConfig {

	/*
	 * @Value("${driverClass}") private String driverClass;
	 * 
	 * @Value("${url}") private String url;
	 * 
	 * @Value("${user}") private String user;
	 * 
	 * @Value("${password}") private String password;
	 */

	@Bean
	public DataSource dataSource() {
		BasicDataSource dataSource = new BasicDataSource();
		dataSource.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		dataSource.setUrl("jdbc:oracle:thin:@192.168.0.35:1521:ora12c");
		dataSource.setUsername("solar");
		dataSource.setPassword("solar");
		return dataSource;
	}



	@Bean
	public LocalSessionFactoryBean sessionFactory() {
		
		Properties props = new Properties();
		props.setProperty("hibernate.dialect", "org.hibernate.dialect.Oracle10gDialect");
		props.setProperty("hibernate.show_sql", "true");
		props.setProperty("hibernate.format_sql", "true");
		props.setProperty("hibernate.use_sql_comments", "true");
		props.setProperty("hibernate.id.new_generator_mappings", "false");
		props.setProperty("hibernate.hbm2ddl.auto", "none");
		
		LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
		sessionFactory.setDataSource(dataSource());
		sessionFactory.setPackagesToScan("entity");
		sessionFactory.setHibernateProperties(props);

		return sessionFactory;
	}

	@Bean
	@Autowired
	public PlatformTransactionManager transactionManager(SessionFactory sessionFactory) {
		HibernateTransactionManager hibernateTransactionManager = new HibernateTransactionManager();
		hibernateTransactionManager.setSessionFactory(sessionFactory);
		return hibernateTransactionManager;
	}
	
	@Bean
	public PersistenceExceptionTranslationPostProcessor persistenceExceptionTranslationPostProcessor() {
		return new PersistenceExceptionTranslationPostProcessor();
	}

	/*
	 * @Bean static PropertySourcesPlaceholderConfigurer
	 * propertySourcesPlaceholderConfigurer(){ return new
	 * PropertySourcesPlaceholderConfigurer(); }
	 */
}

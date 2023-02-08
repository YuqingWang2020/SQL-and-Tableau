SELECT YEAR
	( e.create_time ) AS 'year',
	QUARTER ( e.create_time ) AS 'quarter',
IF
	( f.NAME IS NOT NULL, f.NAME, 'unknown' ) as 'esl-name',
	count( e.esl_id ) AS 'esl_deploy',
/*
	count( IF ( screen_size = 154, 1, NULL ) ) AS '154-deploy',
	count( IF ( screen_size = 213, 1, NULL ) ) AS '213-deploy',
	count( IF ( screen_size = 420, 1, NULL ) ) AS '420-deploy',
	*/
	COUNT( IF ( e.battery <= 26, 1, NULL ) ) AS 'low_battery',
	COUNT(
IF
	( ( ( UNIX_TIMESTAMP(now()) - UNIX_TIMESTAMP( e.last_hb_time ) ) / 86400 ) > 7, 1, NULL ) 
	) AS 'non-hb',
/*
	count( IF ( refresh_times > 0, 1, NULL ) ) AS refresh_total,
	*/
	SUM( IF ( refresh_times > 0, refresh_times, NULL ) ) / count( IF ( refresh_times > 0, 1, NULL ) ) AS average_refresh,
/*
	SUM(
IF
	( refresh_times > 0, refresh_times / ( ( UNIX_TIMESTAMP( now( ) ) - UNIX_TIMESTAMP( create_time ) ) / 86400 ), NULL ) 
	) / count( IF ( refresh_times > 0, 1, NULL ) ) as average_refresh_per_day,
	*/
/*
	count( IF ( led_times > 0, 1, NULL ) ) AS led_total,
	*/
	SUM( IF ( s.total_flash_led_time > 0, s.total_flash_led_time, NULL ) ) / count( IF ( s.total_flash_led_time > 0, 1, NULL ) ) AS average_led 
FROM
	hs_esl e
	left join hs_statistics s on e.customer_code=s.customer_code and e.store_code=s.store_code and e.esl_id=s.esl_id
	LEFT JOIN hs_firmware f ON e.firmware_id = f.id 
GROUP BY
	YEAR ( e.create_time ),
	QUARTER ( e.create_time ),
	e.firmware_id 
HAVING
	count( e.esl_id ) > 100
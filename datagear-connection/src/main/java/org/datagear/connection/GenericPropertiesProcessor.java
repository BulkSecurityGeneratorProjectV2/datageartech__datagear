/*
 * Copyright 2018 datagear.tech
 *
 * Licensed under the LGPLv3 license:
 * http://www.gnu.org/licenses/lgpl-3.0.html
 */

package org.datagear.connection;

import java.sql.Driver;
import java.util.List;
import java.util.Properties;

/**
 * 通用{@linkplain PropertiesProcessor}。
 * 
 * @author datagear@163.com
 *
 */
public class GenericPropertiesProcessor implements PropertiesProcessor
{
	private List<DevotedPropertiesProcessor> devotedPropertiesProcessors;

	public GenericPropertiesProcessor()
	{
		super();
	}

	public List<DevotedPropertiesProcessor> getDevotedPropertiesProcessors()
	{
		return devotedPropertiesProcessors;
	}

	public void setDevotedPropertiesProcessors(List<DevotedPropertiesProcessor> devotedPropertiesProcessors)
	{
		this.devotedPropertiesProcessors = devotedPropertiesProcessors;
	}

	@Override
	public void process(Driver driver, String url, Properties properties)
	{
		DevotedPropertiesProcessor processor = getDevotedPropertiesProcessor(driver, url, properties);

		if (processor == null)
			return;

		processor.process(driver, url, properties);
	}

	protected DevotedPropertiesProcessor getDevotedPropertiesProcessor(Driver driver, String url, Properties properties)
	{
		if (this.devotedPropertiesProcessors == null)
			return null;

		for (DevotedPropertiesProcessor processor : this.devotedPropertiesProcessors)
		{
			if (processor.supports(driver, url, properties))
				return processor;
		}

		return null;
	}
}

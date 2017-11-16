/**
 * 
 */
package com.roi.hadoop.aqua;

/**
 * @author student
 *
 */

import java.io.IOException;

import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class AquaMapper extends Mapper<Object, Text, Text, AquaStat> {

	private final AquaIngest ingest = new AquaIngest();

	@Override
	public void map(Object ignoredKey, Text value, Context context)
			throws IOException, InterruptedException {
		String[] fields = ingest.splitLine(value.toString());
		if (fields == null) {
			context.getCounter(AquaRecorder.NO_AQUA).increment(1);
		} else {
			AquaStat stat = new AquaStat(
					fields[AquaIngest.Fields.Iso3Code.ordinal()],
					Integer.parseInt(fields[AquaIngest.Fields.Tons1995
							.ordinal()]),
					Integer.parseInt(fields[AquaIngest.Fields.Tons2005
							.ordinal()]));
			if (stat.getGrowthRate() > 0) {
				context.getCounter(AquaRecorder.INCREASE_AQUA).increment(1);
			} else {
				context.getCounter(AquaRecorder.DECREASE_AQUA).increment(1);
			}
			String region = fields[AquaIngest.Fields.GeoRegion.ordinal()];
			context.write(new Text(region), stat);
		}
	}
}

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
import org.apache.hadoop.mapreduce.Reducer;

public class MaxRateReducer extends Reducer<Text, AquaStat, Text, AquaStat> {
	@Override
	public void reduce(Text key, Iterable<AquaStat> values, Context context)
			throws IOException, InterruptedException {
		// init at negaive growth rate
		AquaStat max = new AquaStat("junk", 10000, 1);
		for (AquaStat val : values) {
			if (val.getGrowthRate() > max.getGrowthRate()) {
				max = val;
			}
		}
		// write it out
		context.write(key, max);
	}
}

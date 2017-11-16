/**
 * 
 */
package com.roi.hadoop.longestline;

/**
 * @author student
 *
 */

import java.io.IOException;

import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

public class MaxCountReducer extends Reducer<Text, TextLine, Text, TextLine> {
	@Override
	public void reduce(Text key, Iterable<TextLine> values, Context context)
			throws IOException, InterruptedException {
		// compute the max for this key
		TextLine max = new TextLine(0, "");
		for (TextLine val : values) {
			if (val.getLength() > max.getLength()) {
				max = val;
			}
		}
		// write it out
		context.write(key, max);
	}
}

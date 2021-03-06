/**
 * <copyright>
 *
 * This program and the accompanying materials are made available under the
 * terms of the MIT license (X11 license) which accompanies this distribution.
 *
 * </copyright>
 */
package siple;

/**
 * Exception type thrown iff an error occurs throughout a <i>SiPLE</i>
 * program's interpretation. In general, it is impossible to statically
 * guarantee successful program execution.
 * @author Christoff Bürger
 */
public class InterpretationException extends RuntimeException {
	private static final long serialVersionUID = 1L;
	public InterpretationException(String message) {
		super(message);
	}
	public InterpretationException() {
		super("There exist unresolved compilation errors.");
	}
	public String getMessage() {
		return "Interpretation Error: " + super.getMessage();
	}
}

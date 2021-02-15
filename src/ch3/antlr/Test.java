package ch3.antlr;

import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;


public class Test {

    public static void main(String args[]) throws Exception {
    	// create char stream that reads from standard input
		@SuppressWarnings("deprecation")
		ANTLRInputStream input = new ANTLRInputStream(System.in);
    	
    	// create lexes that feeds of input
    	ArrayInitLexer lexer = new ArrayInitLexer(input);
    	
    	// create a buffer of tokens pulled from the lexer
        CommonTokenStream tokens = new CommonTokenStream(lexer);

    	
    	// create a buffer of tokens pulled from the lexer
		ArrayInitParser parser = new ArrayInitParser(tokens);
    	
    	ParseTree tree = parser.init(); // begin pasing at init rule
		System.out.println(tree.toStringTree(parser)); // print LISP-style tree
	}

}


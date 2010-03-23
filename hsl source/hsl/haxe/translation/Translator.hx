﻿/**
 * Copyright (c) 2009-2010, The HSL Contributors.
 *
 * This file is part of HSL. HSL, pronounced "hustle", stands for haXe Signaling Library.
 *
 * HSL is free software. Redistribution and use in source and binary forms, with or without modification, are permitted
 * provided that the following conditions are met:
 *
 *   * Redistributions of source code must retain the above copyright notice, this list of conditions and the following
 *     disclaimer.
 *   * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following
 *     disclaimer in the documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE HSL CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
 * TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE HSL
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 * 
 * End of conditions.
 * 
 * The license of HSL might change in the near future, most likely to match the license of the haXe core libraries.
 */
package hsl.haxe.translation;

/**
 * A translator translates a native event to the properties of a signal.
 * 
 * You can create your own translator by implementing this interface. Translators are often very reusable: you can use them in
 * any project that use the event system the translator was designed for.
 * 
 * This - AVM2 specific - example shows what a translator that extracts the changeList property from a SyncEvent could look
 * like:
 * 
 * <pre>
 * package;
 * import flash.events.SyncEvent;
 * import hsl.haxe.translation.NativeEvent;
 * import hsl.haxe.translation.Translation;
 * import hsl.haxe.translation.Translator;
 * class ChangeListTranslator implements Translator&lt;Array&lt;Dynamic&gt;&gt; {
 * 	public function new():Void {
 * 	}
 * 	public function translate(nativeEvent:NativeEvent):Translation&lt;Array&lt;Dynamic&gt;&gt; {
 * 		var syncEvent:SyncEvent = cast(nativeEvent, SyncEvent);
 * 		return new Translation&lt;Array&lt;Dynamic&gt;&gt;(syncEvent.changeList, syncEvent.target);
 * 	}
 * }
 * </pre>
 */
interface Translator<Datatype> {
	/**
	 * Translates a native event to the properties of a signal.
	 */
	public function translate(nativeEvent:NativeEvent):Translation<Datatype>;
}
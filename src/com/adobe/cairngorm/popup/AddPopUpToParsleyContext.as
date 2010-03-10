/*

Copyright (c) 2009. Adobe Systems Incorporated.
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright notice,
this list of conditions and the following disclaimer.
* Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.
* Neither the name of Adobe Systems Incorporated nor the names of its
contributors may be used to endorse or promote products derived from this
software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.

@ignore
*/
package com.adobe.cairngorm.popup
{
    import flash.display.DisplayObject;
    
    import org.spicefactory.parsley.core.builder.CompositeContextBuilder;
    import org.spicefactory.parsley.core.builder.impl.DefaultCompositeContextBuilder;
    import org.spicefactory.parsley.core.context.Context;
    import org.spicefactory.parsley.flex.FlexContextBuilder;

    public class AddPopUpToParsleyContext implements IPopUpBehavior
    {
        public var context:Context;
        
        public var popupContext:Class;
        
        public var scopes:Array;
        
        private var popup:PopUpBase;

        private var popupView:DisplayObject;

        //------------------------------------------------------------------------
        //
        //  Implementation : IPopUpBehavior
        //
        //------------------------------------------------------------------------

        public function apply(base:PopUpBase):void
        {
            this.popup = base;
            
            base.addEventListener(PopUpEvent.OPENING, onOpening);
            base.addEventListener(PopUpEvent.CLOSING, onClosing);
        }
        
        private function onOpening(event:PopUpEvent):void
        {
            var popup:DisplayObject = DisplayObject(event.popup);
            context.viewManager.addViewRoot(popup);
            
            if(popupContext)
            {
                var builder:CompositeContextBuilder = new DefaultCompositeContextBuilder(popup);
                addScopes(builder);
                FlexContextBuilder.merge(popupContext, builder);
                builder.build();
            }
        }
        
        private function addScopes(builder:CompositeContextBuilder):void
        {
            if(scopes && scopes.length > 0)
            {
                for(var i:int; i < scopes.length; i++)
                {
                    builder.addScope(scopes[i], true);
                }
            }
        }
        
        private function onClosing(event:PopUpEvent):void
        {
            context.viewManager.removeViewRoot(DisplayObject(event.popup));
        }
    }
}
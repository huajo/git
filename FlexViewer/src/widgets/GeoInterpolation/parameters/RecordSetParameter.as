///////////////////////////////////////////////////////////////////////////
// Copyright (c) 2011 Esri. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
///////////////////////////////////////////////////////////////////////////
package widgets.GeoInterpolation.parameters
{

import com.esri.ags.FeatureSet;
import mx.collections.ArrayCollection;

public class RecordSetParameter extends BaseParameter implements IGPParameter
{
    //--------------------------------------------------------------------------
    //
    //  Overridden properties
    //
    //--------------------------------------------------------------------------

    //----------------------------------
    //  defaultValue
    //----------------------------------

    private var _defaultValue;

    override public function get defaultValue():Object
    {
        return _defaultValue;
    }

    override public function set defaultValue(value:Object):void
    {
        _defaultValue = value;
    }

    //----------------------------------
    //  type
    //----------------------------------

    override public function get type():String
    {
        return GPParameterTypes.RECORD_SET;
    }

    //--------------------------------------------------------------------------
    //
    //  Overridden methods
    //
    //--------------------------------------------------------------------------

    override public function defaultValueFromString(text:String):void
    {
        //NOT SUPPORTED - OUTPUT PARAM ONLY
    }
	
	
	//添加一个属性，表示列集合
	private var _fields:ArrayCollection;
	
	public function get fields():ArrayCollection
	{
		return _fields;
	}
	
	public function set fields(value:ArrayCollection):void
	{
		_fields = value;
	}
	
}

}

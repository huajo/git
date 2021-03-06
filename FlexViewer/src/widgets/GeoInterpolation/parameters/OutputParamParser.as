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

import com.esri.ags.symbols.SimpleLineSymbol;
import com.esri.viewer.utils.PopUpInfoParser;
import com.esri.viewer.utils.RendererParser;
import com.esri.viewer.utils.SymbolParser;

import mx.collections.ArrayCollection;

public class OutputParamParser extends BaseParamParser
{
    public function OutputParamParser()
    {
        var outputParamSymbolParser:SymbolParser = new SymbolParser();
        outputParamSymbolParser.defaultPolylineSymbol = new SimpleLineSymbol(SimpleLineSymbol.STYLE_SOLID, 0, 1, 1);
        rendererParser = new RendererParser(outputParamSymbolParser);
    }

    override public function parseParameters(paramsXML:XMLList):Array
    {
        var params:Array = [];
        var param:IGPParameter;

        for each (var paramXML:XML in paramsXML)
        {
            param = GPParameterFactory.getGPParamFromType(paramXML.@type);
            param.label = paramXML.@label;
            param.name = paramXML.@name;
            param.visible = (paramXML.@visible == "true");
            param.toolTip = paramXML.@tooltip;

            var featureParam:IGPFeatureParameter = param as IGPFeatureParameter;
            if (featureParam)
            {
                featureParam.geometryType = paramXML.@geometrytype;
                featureParam.layerName = featureParam.label;

                if (paramXML.popup[0])
                {
                    featureParam.popUpInfo = PopUpInfoParser.parsePopUpInfo(paramXML.popup[0]);
                }

                if (featureParam.geometryType)
                {
                    featureParam.renderer = parseRenderer(paramXML, featureParam.geometryType);
                }
            }
			
			
			//如果是 RecordSetParameter类型的参数，则对此参数设置“fields”属性
			var recordSetParam:RecordSetParameter = param as RecordSetParameter;
			if (recordSetParam)
			{
				var columns:ArrayCollection = new ArrayCollection();
				//遍历field元素，添加到recordSetParam对象的fields属性中
				for each(var current:XML in paramXML.field){
					trace(current.@name);
					trace(current.@label);
					columns.addItem({"name":String(current.@name),"label":String(current.@label)});
				}
				//设置“recordSetParam”对象的属性，此时“param”对象的属性同样被设置
				recordSetParam.fields = columns;
			}

            params.push(param);
        }

        return params;
    }
}
}

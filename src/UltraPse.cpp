/****************************************************************************
 * UltraPse.cpp - Copyright 2017 Pu-Feng Du, Ph.D.                          *
 *                                                                          *
 * This file is a part of the software: UltraPse                            *
 * UltraPse is free software: you can redistribute it and/or modify         *
 * it under the terms of the GNU General Public License as published by     *
 * the Free Software Foundation, either version 3 of the License, or        *
 * (at your option) any later version.                                      *
 *                                                                          *
 * UltraPse is distributed in the hope that it will be useful,              *
 * but WITHOUT ANY WARRANTY; without even the implied warranty of           *
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            *
 * GNU General Public License for more details.                             *
 *                                                                          *
 * You should have received a copy of the GNU General Public License        *
 * along with UltraPse.  If not, see <http://www.gnu.org/licenses/>.        *
 ****************************************************************************/

#include <Rcpp.h>
#include "UltraPse.h"

using namespace std;
using namespace UltraPse;
using namespace Rcpp;


// [[Rcpp::export]]
void runUpse(const char* input,
	        const char* format,
	        const char* module,
	        const char* note, 
            const char* property,
            const char* omega,
            const char* lambda,
            const char* type)
{
    //PseTask *UltraPseTask = ParseCUI(argc, argv);
    PseTask *r = new PseTask(); //
    r->SetInputFile(input);
    r->SetOutputFormat(format);
    r->AddModule(module);
    r->SetNotationName(note);
    if (module = "pes"){
    r->AddProperty(property);
    r->AddExtraPara(_cmd_omega_name, omega);
    r->AddExtraPara(_cmd_lambda_name, lambda);
    r->AddExtraPara(_cmd_subtype, type);
    };

    Operator *App = new Operator();
    App->SetTask(r);
    //App->CreateLuaVM();
    App->Prepare();
    App->Execute();
    delete App;
    delete r;
    //return 0;
}


// [[Rcpp::export]]
int available_property(const char* note)
{
    const char* query = "prop";

    PseTask *r = new PseTask(); 
    r->SetNotationName(note);
    r->ActivateQueryMode(query);

    Operator *App = new Operator();
    App->SetTask(r);
    App->Prepare();
    App->Execute();
    delete App;
    delete r;
    //return 0;
}

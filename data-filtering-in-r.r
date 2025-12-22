{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "09a8d2a2",
   "metadata": {
    "papermill": {
     "duration": 0.007405,
     "end_time": "2025-12-22T15:09:20.638205",
     "exception": false,
     "start_time": "2025-12-22T15:09:20.630800",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## স্টেপ ১: প্যাকেজ ইনস্টলেশন ও লোডিং"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "5a6fb7db",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-12-22T15:09:20.655971Z",
     "iopub.status.busy": "2025-12-22T15:09:20.653674Z",
     "iopub.status.idle": "2025-12-22T15:09:37.588541Z",
     "shell.execute_reply": "2025-12-22T15:09:37.586648Z"
    },
    "papermill": {
     "duration": 16.94643,
     "end_time": "2025-12-22T15:09:37.591154",
     "exception": false,
     "start_time": "2025-12-22T15:09:20.644724",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Installing package into ‘/usr/local/lib/R/site-library’\n",
      "(as ‘lib’ is unspecified)\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching core tidyverse packages\u001b[22m ──────────────────────── tidyverse 2.0.0 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mdplyr    \u001b[39m 1.1.4     \u001b[32m✔\u001b[39m \u001b[34mreadr    \u001b[39m 2.1.5\n",
      "\u001b[32m✔\u001b[39m \u001b[34mforcats  \u001b[39m 1.0.0     \u001b[32m✔\u001b[39m \u001b[34mstringr  \u001b[39m 1.5.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2  \u001b[39m 3.5.1     \u001b[32m✔\u001b[39m \u001b[34mtibble   \u001b[39m 3.2.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mlubridate\u001b[39m 1.9.3     \u001b[32m✔\u001b[39m \u001b[34mtidyr    \u001b[39m 1.3.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mpurrr    \u001b[39m 1.0.2     \n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\u001b[36mℹ\u001b[39m Use the conflicted package (\u001b[3m\u001b[34m<http://conflicted.r-lib.org/>\u001b[39m\u001b[23m) to force all conflicts to become errors\n"
     ]
    }
   ],
   "source": [
    "# টাইডিভার্স প্যাকেজ ইনস্টল করুন (প্রথমবারের জন্য)\n",
    "install.packages(\"tidyverse\")\n",
    "\n",
    "# প্যাকেজ লোড করুন\n",
    "library(tidyverse)\n",
    "# অথবা\n",
    "require(tidyverse)\n",
    "\n",
    "# msleep ডাটাসেট দেখুন\n",
    "view(msleep)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "d6d3d95f",
   "metadata": {
    "papermill": {
     "duration": 0.006534,
     "end_time": "2025-12-22T15:09:37.604446",
     "exception": false,
     "start_time": "2025-12-22T15:09:37.597912",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### ব্যাখ্যা:\n",
    "* msleep ডাটাসেটে ৮৩টি স্তন্যপায়ী প্রাণীর ঘুম সম্পর্কিত ডাটা আছে\n",
    "* এতে নাম, ঘুমের সময়, ব্রেইন ওজন, বডি ওজন ইত্যাদি তথ্য আছে\n",
    "* এটি ggplot2 প্যাকেজের সাথে আসে\n",
    "\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "8c0e40bf",
   "metadata": {
    "papermill": {
     "duration": 0.00634,
     "end_time": "2025-12-22T15:09:37.617236",
     "exception": false,
     "start_time": "2025-12-22T15:09:37.610896",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## টিপ ১: সরল ফিল্টারিং (সিংগেল কন্ডিশন)\n",
    "### ১.১ যেসব প্রাণী ১৮ ঘণ্টার বেশি ঘুমায়"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "3f884d0f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-12-22T15:09:37.666395Z",
     "iopub.status.busy": "2025-12-22T15:09:37.632537Z",
     "iopub.status.idle": "2025-12-22T15:09:37.732092Z",
     "shell.execute_reply": "2025-12-22T15:09:37.729459Z"
    },
    "papermill": {
     "duration": 0.111815,
     "end_time": "2025-12-22T15:09:37.735623",
     "exception": false,
     "start_time": "2025-12-22T15:09:37.623808",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "\u001b[90m# A tibble: 4 × 2\u001b[39m\n",
      "  name                 sleep_total\n",
      "  \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m                      \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m\n",
      "\u001b[90m1\u001b[39m Big brown bat               19.7\n",
      "\u001b[90m2\u001b[39m Thick-tailed opposum        19.4\n",
      "\u001b[90m3\u001b[39m Little brown bat            19.9\n",
      "\u001b[90m4\u001b[39m Giant armadillo             18.1\n"
     ]
    }
   ],
   "source": [
    "long_sleepers <- msleep %>% \n",
    "  select(name, sleep_total) %>% \n",
    "  filter(sleep_total > 18)\n",
    "\n",
    "print(long_sleepers)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "34e6ac76",
   "metadata": {
    "papermill": {
     "duration": 0.006774,
     "end_time": "2025-12-22T15:09:37.749984",
     "exception": false,
     "start_time": "2025-12-22T15:09:37.743210",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### ব্যাখ্যা:\n",
    "* %>% পাইপ অপারেটর ডাটাকে পরের ফাংশনে পাঠায়\n",
    "* select() শুধু name ও sleep_total কলাম রাখে\n",
    "* filter(sleep_total > 18) শুধুমাত্র ১৮-এর বেশি ঘুমানো প্রাণীগুলো রাখে"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3d35a9dc",
   "metadata": {
    "papermill": {
     "duration": 0.006368,
     "end_time": "2025-12-22T15:09:37.762882",
     "exception": false,
     "start_time": "2025-12-22T15:09:37.756514",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### ১.২ যেসব প্রাণী ১৮ ঘণ্টার কম ঘুমায়"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "940eca0b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-12-22T15:09:37.780798Z",
     "iopub.status.busy": "2025-12-22T15:09:37.779165Z",
     "iopub.status.idle": "2025-12-22T15:09:37.866136Z",
     "shell.execute_reply": "2025-12-22T15:09:37.862980Z"
    },
    "papermill": {
     "duration": 0.099071,
     "end_time": "2025-12-22T15:09:37.869462",
     "exception": false,
     "start_time": "2025-12-22T15:09:37.770391",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 79 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>name</th><th scope=col>sleep_total</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Cheetah                   </td><td>12.1</td></tr>\n",
       "\t<tr><td>Owl monkey                </td><td>17.0</td></tr>\n",
       "\t<tr><td>Mountain beaver           </td><td>14.4</td></tr>\n",
       "\t<tr><td>Greater short-tailed shrew</td><td>14.9</td></tr>\n",
       "\t<tr><td>Cow                       </td><td> 4.0</td></tr>\n",
       "\t<tr><td>Three-toed sloth          </td><td>14.4</td></tr>\n",
       "\t<tr><td>Northern fur seal         </td><td> 8.7</td></tr>\n",
       "\t<tr><td>Vesper mouse              </td><td> 7.0</td></tr>\n",
       "\t<tr><td>Dog                       </td><td>10.1</td></tr>\n",
       "\t<tr><td>Roe deer                  </td><td> 3.0</td></tr>\n",
       "\t<tr><td>Goat                      </td><td> 5.3</td></tr>\n",
       "\t<tr><td>Guinea pig                </td><td> 9.4</td></tr>\n",
       "\t<tr><td>Grivet                    </td><td>10.0</td></tr>\n",
       "\t<tr><td>Chinchilla                </td><td>12.5</td></tr>\n",
       "\t<tr><td>Star-nosed mole           </td><td>10.3</td></tr>\n",
       "\t<tr><td>African giant pouched rat </td><td> 8.3</td></tr>\n",
       "\t<tr><td>Lesser short-tailed shrew </td><td> 9.1</td></tr>\n",
       "\t<tr><td>Long-nosed armadillo      </td><td>17.4</td></tr>\n",
       "\t<tr><td>Tree hyrax                </td><td> 5.3</td></tr>\n",
       "\t<tr><td>North American Opossum    </td><td>18.0</td></tr>\n",
       "\t<tr><td>Asian elephant            </td><td> 3.9</td></tr>\n",
       "\t<tr><td>Horse                     </td><td> 2.9</td></tr>\n",
       "\t<tr><td>Donkey                    </td><td> 3.1</td></tr>\n",
       "\t<tr><td>European hedgehog         </td><td>10.1</td></tr>\n",
       "\t<tr><td>Patas monkey              </td><td>10.9</td></tr>\n",
       "\t<tr><td>Western american chipmunk </td><td>14.9</td></tr>\n",
       "\t<tr><td>Domestic cat              </td><td>12.5</td></tr>\n",
       "\t<tr><td>Galago                    </td><td> 9.8</td></tr>\n",
       "\t<tr><td>Giraffe                   </td><td> 1.9</td></tr>\n",
       "\t<tr><td>Pilot whale               </td><td> 2.7</td></tr>\n",
       "\t<tr><td>⋮</td><td>⋮</td></tr>\n",
       "\t<tr><td>Lion                          </td><td>13.5</td></tr>\n",
       "\t<tr><td>Baboon                        </td><td> 9.4</td></tr>\n",
       "\t<tr><td>Desert hedgehog               </td><td>10.3</td></tr>\n",
       "\t<tr><td>Potto                         </td><td>11.0</td></tr>\n",
       "\t<tr><td>Deer mouse                    </td><td>11.5</td></tr>\n",
       "\t<tr><td>Phalanger                     </td><td>13.7</td></tr>\n",
       "\t<tr><td>Caspian seal                  </td><td> 3.5</td></tr>\n",
       "\t<tr><td>Common porpoise               </td><td> 5.6</td></tr>\n",
       "\t<tr><td>Potoroo                       </td><td>11.1</td></tr>\n",
       "\t<tr><td>Rock hyrax                    </td><td> 5.4</td></tr>\n",
       "\t<tr><td>Laboratory rat                </td><td>13.0</td></tr>\n",
       "\t<tr><td>African striped mouse         </td><td> 8.7</td></tr>\n",
       "\t<tr><td>Squirrel monkey               </td><td> 9.6</td></tr>\n",
       "\t<tr><td>Eastern american mole         </td><td> 8.4</td></tr>\n",
       "\t<tr><td>Cotton rat                    </td><td>11.3</td></tr>\n",
       "\t<tr><td>Mole rat                      </td><td>10.6</td></tr>\n",
       "\t<tr><td>Arctic ground squirrel        </td><td>16.6</td></tr>\n",
       "\t<tr><td>Thirteen-lined ground squirrel</td><td>13.8</td></tr>\n",
       "\t<tr><td>Golden-mantled ground squirrel</td><td>15.9</td></tr>\n",
       "\t<tr><td>Musk shrew                    </td><td>12.8</td></tr>\n",
       "\t<tr><td>Pig                           </td><td> 9.1</td></tr>\n",
       "\t<tr><td>Short-nosed echidna           </td><td> 8.6</td></tr>\n",
       "\t<tr><td>Eastern american chipmunk     </td><td>15.8</td></tr>\n",
       "\t<tr><td>Brazilian tapir               </td><td> 4.4</td></tr>\n",
       "\t<tr><td>Tenrec                        </td><td>15.6</td></tr>\n",
       "\t<tr><td>Tree shrew                    </td><td> 8.9</td></tr>\n",
       "\t<tr><td>Bottle-nosed dolphin          </td><td> 5.2</td></tr>\n",
       "\t<tr><td>Genet                         </td><td> 6.3</td></tr>\n",
       "\t<tr><td>Arctic fox                    </td><td>12.5</td></tr>\n",
       "\t<tr><td>Red fox                       </td><td> 9.8</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 79 × 2\n",
       "\\begin{tabular}{ll}\n",
       " name & sleep\\_total\\\\\n",
       " <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t Cheetah                    & 12.1\\\\\n",
       "\t Owl monkey                 & 17.0\\\\\n",
       "\t Mountain beaver            & 14.4\\\\\n",
       "\t Greater short-tailed shrew & 14.9\\\\\n",
       "\t Cow                        &  4.0\\\\\n",
       "\t Three-toed sloth           & 14.4\\\\\n",
       "\t Northern fur seal          &  8.7\\\\\n",
       "\t Vesper mouse               &  7.0\\\\\n",
       "\t Dog                        & 10.1\\\\\n",
       "\t Roe deer                   &  3.0\\\\\n",
       "\t Goat                       &  5.3\\\\\n",
       "\t Guinea pig                 &  9.4\\\\\n",
       "\t Grivet                     & 10.0\\\\\n",
       "\t Chinchilla                 & 12.5\\\\\n",
       "\t Star-nosed mole            & 10.3\\\\\n",
       "\t African giant pouched rat  &  8.3\\\\\n",
       "\t Lesser short-tailed shrew  &  9.1\\\\\n",
       "\t Long-nosed armadillo       & 17.4\\\\\n",
       "\t Tree hyrax                 &  5.3\\\\\n",
       "\t North American Opossum     & 18.0\\\\\n",
       "\t Asian elephant             &  3.9\\\\\n",
       "\t Horse                      &  2.9\\\\\n",
       "\t Donkey                     &  3.1\\\\\n",
       "\t European hedgehog          & 10.1\\\\\n",
       "\t Patas monkey               & 10.9\\\\\n",
       "\t Western american chipmunk  & 14.9\\\\\n",
       "\t Domestic cat               & 12.5\\\\\n",
       "\t Galago                     &  9.8\\\\\n",
       "\t Giraffe                    &  1.9\\\\\n",
       "\t Pilot whale                &  2.7\\\\\n",
       "\t ⋮ & ⋮\\\\\n",
       "\t Lion                           & 13.5\\\\\n",
       "\t Baboon                         &  9.4\\\\\n",
       "\t Desert hedgehog                & 10.3\\\\\n",
       "\t Potto                          & 11.0\\\\\n",
       "\t Deer mouse                     & 11.5\\\\\n",
       "\t Phalanger                      & 13.7\\\\\n",
       "\t Caspian seal                   &  3.5\\\\\n",
       "\t Common porpoise                &  5.6\\\\\n",
       "\t Potoroo                        & 11.1\\\\\n",
       "\t Rock hyrax                     &  5.4\\\\\n",
       "\t Laboratory rat                 & 13.0\\\\\n",
       "\t African striped mouse          &  8.7\\\\\n",
       "\t Squirrel monkey                &  9.6\\\\\n",
       "\t Eastern american mole          &  8.4\\\\\n",
       "\t Cotton rat                     & 11.3\\\\\n",
       "\t Mole rat                       & 10.6\\\\\n",
       "\t Arctic ground squirrel         & 16.6\\\\\n",
       "\t Thirteen-lined ground squirrel & 13.8\\\\\n",
       "\t Golden-mantled ground squirrel & 15.9\\\\\n",
       "\t Musk shrew                     & 12.8\\\\\n",
       "\t Pig                            &  9.1\\\\\n",
       "\t Short-nosed echidna            &  8.6\\\\\n",
       "\t Eastern american chipmunk      & 15.8\\\\\n",
       "\t Brazilian tapir                &  4.4\\\\\n",
       "\t Tenrec                         & 15.6\\\\\n",
       "\t Tree shrew                     &  8.9\\\\\n",
       "\t Bottle-nosed dolphin           &  5.2\\\\\n",
       "\t Genet                          &  6.3\\\\\n",
       "\t Arctic fox                     & 12.5\\\\\n",
       "\t Red fox                        &  9.8\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 79 × 2\n",
       "\n",
       "| name &lt;chr&gt; | sleep_total &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| Cheetah                    | 12.1 |\n",
       "| Owl monkey                 | 17.0 |\n",
       "| Mountain beaver            | 14.4 |\n",
       "| Greater short-tailed shrew | 14.9 |\n",
       "| Cow                        |  4.0 |\n",
       "| Three-toed sloth           | 14.4 |\n",
       "| Northern fur seal          |  8.7 |\n",
       "| Vesper mouse               |  7.0 |\n",
       "| Dog                        | 10.1 |\n",
       "| Roe deer                   |  3.0 |\n",
       "| Goat                       |  5.3 |\n",
       "| Guinea pig                 |  9.4 |\n",
       "| Grivet                     | 10.0 |\n",
       "| Chinchilla                 | 12.5 |\n",
       "| Star-nosed mole            | 10.3 |\n",
       "| African giant pouched rat  |  8.3 |\n",
       "| Lesser short-tailed shrew  |  9.1 |\n",
       "| Long-nosed armadillo       | 17.4 |\n",
       "| Tree hyrax                 |  5.3 |\n",
       "| North American Opossum     | 18.0 |\n",
       "| Asian elephant             |  3.9 |\n",
       "| Horse                      |  2.9 |\n",
       "| Donkey                     |  3.1 |\n",
       "| European hedgehog          | 10.1 |\n",
       "| Patas monkey               | 10.9 |\n",
       "| Western american chipmunk  | 14.9 |\n",
       "| Domestic cat               | 12.5 |\n",
       "| Galago                     |  9.8 |\n",
       "| Giraffe                    |  1.9 |\n",
       "| Pilot whale                |  2.7 |\n",
       "| ⋮ | ⋮ |\n",
       "| Lion                           | 13.5 |\n",
       "| Baboon                         |  9.4 |\n",
       "| Desert hedgehog                | 10.3 |\n",
       "| Potto                          | 11.0 |\n",
       "| Deer mouse                     | 11.5 |\n",
       "| Phalanger                      | 13.7 |\n",
       "| Caspian seal                   |  3.5 |\n",
       "| Common porpoise                |  5.6 |\n",
       "| Potoroo                        | 11.1 |\n",
       "| Rock hyrax                     |  5.4 |\n",
       "| Laboratory rat                 | 13.0 |\n",
       "| African striped mouse          |  8.7 |\n",
       "| Squirrel monkey                |  9.6 |\n",
       "| Eastern american mole          |  8.4 |\n",
       "| Cotton rat                     | 11.3 |\n",
       "| Mole rat                       | 10.6 |\n",
       "| Arctic ground squirrel         | 16.6 |\n",
       "| Thirteen-lined ground squirrel | 13.8 |\n",
       "| Golden-mantled ground squirrel | 15.9 |\n",
       "| Musk shrew                     | 12.8 |\n",
       "| Pig                            |  9.1 |\n",
       "| Short-nosed echidna            |  8.6 |\n",
       "| Eastern american chipmunk      | 15.8 |\n",
       "| Brazilian tapir                |  4.4 |\n",
       "| Tenrec                         | 15.6 |\n",
       "| Tree shrew                     |  8.9 |\n",
       "| Bottle-nosed dolphin           |  5.2 |\n",
       "| Genet                          |  6.3 |\n",
       "| Arctic fox                     | 12.5 |\n",
       "| Red fox                        |  9.8 |\n",
       "\n"
      ],
      "text/plain": [
       "   name                           sleep_total\n",
       "1  Cheetah                        12.1       \n",
       "2  Owl monkey                     17.0       \n",
       "3  Mountain beaver                14.4       \n",
       "4  Greater short-tailed shrew     14.9       \n",
       "5  Cow                             4.0       \n",
       "6  Three-toed sloth               14.4       \n",
       "7  Northern fur seal               8.7       \n",
       "8  Vesper mouse                    7.0       \n",
       "9  Dog                            10.1       \n",
       "10 Roe deer                        3.0       \n",
       "11 Goat                            5.3       \n",
       "12 Guinea pig                      9.4       \n",
       "13 Grivet                         10.0       \n",
       "14 Chinchilla                     12.5       \n",
       "15 Star-nosed mole                10.3       \n",
       "16 African giant pouched rat       8.3       \n",
       "17 Lesser short-tailed shrew       9.1       \n",
       "18 Long-nosed armadillo           17.4       \n",
       "19 Tree hyrax                      5.3       \n",
       "20 North American Opossum         18.0       \n",
       "21 Asian elephant                  3.9       \n",
       "22 Horse                           2.9       \n",
       "23 Donkey                          3.1       \n",
       "24 European hedgehog              10.1       \n",
       "25 Patas monkey                   10.9       \n",
       "26 Western american chipmunk      14.9       \n",
       "27 Domestic cat                   12.5       \n",
       "28 Galago                          9.8       \n",
       "29 Giraffe                         1.9       \n",
       "30 Pilot whale                     2.7       \n",
       "⋮  ⋮                              ⋮          \n",
       "50 Lion                           13.5       \n",
       "51 Baboon                          9.4       \n",
       "52 Desert hedgehog                10.3       \n",
       "53 Potto                          11.0       \n",
       "54 Deer mouse                     11.5       \n",
       "55 Phalanger                      13.7       \n",
       "56 Caspian seal                    3.5       \n",
       "57 Common porpoise                 5.6       \n",
       "58 Potoroo                        11.1       \n",
       "59 Rock hyrax                      5.4       \n",
       "60 Laboratory rat                 13.0       \n",
       "61 African striped mouse           8.7       \n",
       "62 Squirrel monkey                 9.6       \n",
       "63 Eastern american mole           8.4       \n",
       "64 Cotton rat                     11.3       \n",
       "65 Mole rat                       10.6       \n",
       "66 Arctic ground squirrel         16.6       \n",
       "67 Thirteen-lined ground squirrel 13.8       \n",
       "68 Golden-mantled ground squirrel 15.9       \n",
       "69 Musk shrew                     12.8       \n",
       "70 Pig                             9.1       \n",
       "71 Short-nosed echidna             8.6       \n",
       "72 Eastern american chipmunk      15.8       \n",
       "73 Brazilian tapir                 4.4       \n",
       "74 Tenrec                         15.6       \n",
       "75 Tree shrew                      8.9       \n",
       "76 Bottle-nosed dolphin            5.2       \n",
       "77 Genet                           6.3       \n",
       "78 Arctic fox                     12.5       \n",
       "79 Red fox                         9.8       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "short_sleepers <- msleep %>% \n",
    "  select(name, sleep_total) %>% \n",
    "  filter(!sleep_total > 18)  # NOT অপারেটর ব্যবহার\n",
    "\n",
    "# অথবা সরাসরি\n",
    "short_sleepers <- msleep %>% \n",
    "  select(name, sleep_total) %>% \n",
    "  filter(sleep_total <= 18)\n",
    "\n",
    "short_sleepers"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "58431a7f",
   "metadata": {
    "papermill": {
     "duration": 0.007054,
     "end_time": "2025-12-22T15:09:37.883877",
     "exception": false,
     "start_time": "2025-12-22T15:09:37.876823",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### ব্যাখ্যা:\n",
    "* ! হলো লজিক্যাল NOT অপারেটর\n",
    "* !sleep_total > 18 মানে \"NOT (sleep_total > 18)\"\n",
    "* এটি sleep_total <= 18 এর সমতুল্য"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "66feea52",
   "metadata": {
    "papermill": {
     "duration": 0.006977,
     "end_time": "2025-12-22T15:09:37.898077",
     "exception": false,
     "start_time": "2025-12-22T15:09:37.891100",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## টিপ ২: মাল্টিপল কন্ডিশন (AND অপারেটর)\n",
    "### ২.১ কমা (,) ব্যবহার করে AND অপারেশন"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "453676ce",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-12-22T15:09:37.915854Z",
     "iopub.status.busy": "2025-12-22T15:09:37.914183Z",
     "iopub.status.idle": "2025-12-22T15:09:37.949747Z",
     "shell.execute_reply": "2025-12-22T15:09:37.947341Z"
    },
    "papermill": {
     "duration": 0.047826,
     "end_time": "2025-12-22T15:09:37.952926",
     "exception": false,
     "start_time": "2025-12-22T15:09:37.905100",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 3 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>name</th><th scope=col>order</th><th scope=col>bodywt</th><th scope=col>sleep_total</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Human     </td><td>Primates</td><td>62.000</td><td>8.0</td></tr>\n",
       "\t<tr><td>Chimpanzee</td><td>Primates</td><td>52.200</td><td>9.7</td></tr>\n",
       "\t<tr><td>Baboon    </td><td>Primates</td><td>25.235</td><td>9.4</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 3 × 4\n",
       "\\begin{tabular}{llll}\n",
       " name & order & bodywt & sleep\\_total\\\\\n",
       " <chr> & <chr> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t Human      & Primates & 62.000 & 8.0\\\\\n",
       "\t Chimpanzee & Primates & 52.200 & 9.7\\\\\n",
       "\t Baboon     & Primates & 25.235 & 9.4\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 3 × 4\n",
       "\n",
       "| name &lt;chr&gt; | order &lt;chr&gt; | bodywt &lt;dbl&gt; | sleep_total &lt;dbl&gt; |\n",
       "|---|---|---|---|\n",
       "| Human      | Primates | 62.000 | 8.0 |\n",
       "| Chimpanzee | Primates | 52.200 | 9.7 |\n",
       "| Baboon     | Primates | 25.235 | 9.4 |\n",
       "\n"
      ],
      "text/plain": [
       "  name       order    bodywt sleep_total\n",
       "1 Human      Primates 62.000 8.0        \n",
       "2 Chimpanzee Primates 52.200 9.7        \n",
       "3 Baboon     Primates 25.235 9.4        "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "primates_heavy <- msleep %>% \n",
    "  select(name, order, bodywt, sleep_total) %>% \n",
    "  filter(order == \"Primates\", bodywt > 20)\n",
    "\n",
    "primates_heavy"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "aaa34f33",
   "metadata": {
    "papermill": {
     "duration": 0.007185,
     "end_time": "2025-12-22T15:09:37.967770",
     "exception": false,
     "start_time": "2025-12-22T15:09:37.960585",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### ### ব্যাখ্যা:\n",
    "* কমা (,) দিয়ে একাধিক কন্ডিশন দিলে সেটি AND অপারেটর হিসেবে কাজ করে\n",
    "* অর্থাৎ: order == \"Primates\" এবং bodywt > 20\n",
    "* দুইটি শর্তই পূরণ হতে হবে"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "d408e100",
   "metadata": {
    "papermill": {
     "duration": 0.007082,
     "end_time": "2025-12-22T15:09:37.982021",
     "exception": false,
     "start_time": "2025-12-22T15:09:37.974939",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### ২.২ এম্পারস্যান্ড (&) ব্যবহার করে"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "97919001",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-12-22T15:09:38.000409Z",
     "iopub.status.busy": "2025-12-22T15:09:37.998770Z",
     "iopub.status.idle": "2025-12-22T15:09:38.034847Z",
     "shell.execute_reply": "2025-12-22T15:09:38.032358Z"
    },
    "papermill": {
     "duration": 0.048789,
     "end_time": "2025-12-22T15:09:38.038110",
     "exception": false,
     "start_time": "2025-12-22T15:09:37.989321",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 3 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>name</th><th scope=col>order</th><th scope=col>bodywt</th><th scope=col>sleep_total</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Human     </td><td>Primates</td><td>62.000</td><td>8.0</td></tr>\n",
       "\t<tr><td>Chimpanzee</td><td>Primates</td><td>52.200</td><td>9.7</td></tr>\n",
       "\t<tr><td>Baboon    </td><td>Primates</td><td>25.235</td><td>9.4</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 3 × 4\n",
       "\\begin{tabular}{llll}\n",
       " name & order & bodywt & sleep\\_total\\\\\n",
       " <chr> & <chr> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t Human      & Primates & 62.000 & 8.0\\\\\n",
       "\t Chimpanzee & Primates & 52.200 & 9.7\\\\\n",
       "\t Baboon     & Primates & 25.235 & 9.4\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 3 × 4\n",
       "\n",
       "| name &lt;chr&gt; | order &lt;chr&gt; | bodywt &lt;dbl&gt; | sleep_total &lt;dbl&gt; |\n",
       "|---|---|---|---|\n",
       "| Human      | Primates | 62.000 | 8.0 |\n",
       "| Chimpanzee | Primates | 52.200 | 9.7 |\n",
       "| Baboon     | Primates | 25.235 | 9.4 |\n",
       "\n"
      ],
      "text/plain": [
       "  name       order    bodywt sleep_total\n",
       "1 Human      Primates 62.000 8.0        \n",
       "2 Chimpanzee Primates 52.200 9.7        \n",
       "3 Baboon     Primates 25.235 9.4        "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "primates_heavy <- msleep %>% \n",
    "  select(name, order, bodywt, sleep_total) %>% \n",
    "  filter(order == \"Primates\" & bodywt > 20)\n",
    "\n",
    "primates_heavy"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "8350255c",
   "metadata": {
    "papermill": {
     "duration": 0.007541,
     "end_time": "2025-12-22T15:09:38.053380",
     "exception": false,
     "start_time": "2025-12-22T15:09:38.045839",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### দুইটিই একই কাজ করে। আপনি যেকোনোটা ব্যবহার করতে পারেন!\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3c03aeb4",
   "metadata": {
    "papermill": {
     "duration": 0.00753,
     "end_time": "2025-12-22T15:09:38.068522",
     "exception": false,
     "start_time": "2025-12-22T15:09:38.060992",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## টিপ ৩: OR অপারেটর ব্যবহার\n",
    "### ৩.১ পাইপ (|) দিয়ে OR অপারেশন"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "767cd506",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-12-22T15:09:38.087340Z",
     "iopub.status.busy": "2025-12-22T15:09:38.085667Z",
     "iopub.status.idle": "2025-12-22T15:09:38.142152Z",
     "shell.execute_reply": "2025-12-22T15:09:38.134105Z"
    },
    "papermill": {
     "duration": 0.069082,
     "end_time": "2025-12-22T15:09:38.145045",
     "exception": false,
     "start_time": "2025-12-22T15:09:38.075963",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 33 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>name</th><th scope=col>order</th><th scope=col>bodywt</th><th scope=col>sleep_total</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Cheetah             </td><td>Carnivora     </td><td>  50.000</td><td>12.1</td></tr>\n",
       "\t<tr><td>Owl monkey          </td><td>Primates      </td><td>   0.480</td><td>17.0</td></tr>\n",
       "\t<tr><td>Cow                 </td><td>Artiodactyla  </td><td> 600.000</td><td> 4.0</td></tr>\n",
       "\t<tr><td>Northern fur seal   </td><td>Carnivora     </td><td>  20.490</td><td> 8.7</td></tr>\n",
       "\t<tr><td>Goat                </td><td>Artiodactyla  </td><td>  33.500</td><td> 5.3</td></tr>\n",
       "\t<tr><td>Grivet              </td><td>Primates      </td><td>   4.750</td><td>10.0</td></tr>\n",
       "\t<tr><td>Asian elephant      </td><td>Proboscidea   </td><td>2547.000</td><td> 3.9</td></tr>\n",
       "\t<tr><td>Horse               </td><td>Perissodactyla</td><td> 521.000</td><td> 2.9</td></tr>\n",
       "\t<tr><td>Donkey              </td><td>Perissodactyla</td><td> 187.000</td><td> 3.1</td></tr>\n",
       "\t<tr><td>Patas monkey        </td><td>Primates      </td><td>  10.000</td><td>10.9</td></tr>\n",
       "\t<tr><td>Galago              </td><td>Primates      </td><td>   0.200</td><td> 9.8</td></tr>\n",
       "\t<tr><td>Giraffe             </td><td>Artiodactyla  </td><td> 899.995</td><td> 1.9</td></tr>\n",
       "\t<tr><td>Pilot whale         </td><td>Cetacea       </td><td> 800.000</td><td> 2.7</td></tr>\n",
       "\t<tr><td>Gray seal           </td><td>Carnivora     </td><td>  85.000</td><td> 6.2</td></tr>\n",
       "\t<tr><td>Human               </td><td>Primates      </td><td>  62.000</td><td> 8.0</td></tr>\n",
       "\t<tr><td>Mongoose lemur      </td><td>Primates      </td><td>   1.670</td><td> 9.5</td></tr>\n",
       "\t<tr><td>African elephant    </td><td>Proboscidea   </td><td>6654.000</td><td> 3.3</td></tr>\n",
       "\t<tr><td>Macaque             </td><td>Primates      </td><td>   6.800</td><td>10.1</td></tr>\n",
       "\t<tr><td>Slow loris          </td><td>Primates      </td><td>   1.400</td><td>11.0</td></tr>\n",
       "\t<tr><td>Sheep               </td><td>Artiodactyla  </td><td>  55.500</td><td> 3.8</td></tr>\n",
       "\t<tr><td>Chimpanzee          </td><td>Primates      </td><td>  52.200</td><td> 9.7</td></tr>\n",
       "\t<tr><td>Tiger               </td><td>Carnivora     </td><td> 162.564</td><td>15.8</td></tr>\n",
       "\t<tr><td>Jaguar              </td><td>Carnivora     </td><td> 100.000</td><td>10.4</td></tr>\n",
       "\t<tr><td>Lion                </td><td>Carnivora     </td><td> 161.499</td><td>13.5</td></tr>\n",
       "\t<tr><td>Baboon              </td><td>Primates      </td><td>  25.235</td><td> 9.4</td></tr>\n",
       "\t<tr><td>Potto               </td><td>Primates      </td><td>   1.100</td><td>11.0</td></tr>\n",
       "\t<tr><td>Caspian seal        </td><td>Carnivora     </td><td>  86.000</td><td> 3.5</td></tr>\n",
       "\t<tr><td>Common porpoise     </td><td>Cetacea       </td><td>  53.180</td><td> 5.6</td></tr>\n",
       "\t<tr><td>Giant armadillo     </td><td>Cingulata     </td><td>  60.000</td><td>18.1</td></tr>\n",
       "\t<tr><td>Squirrel monkey     </td><td>Primates      </td><td>   0.743</td><td> 9.6</td></tr>\n",
       "\t<tr><td>Pig                 </td><td>Artiodactyla  </td><td>  86.250</td><td> 9.1</td></tr>\n",
       "\t<tr><td>Brazilian tapir     </td><td>Perissodactyla</td><td> 207.501</td><td> 4.4</td></tr>\n",
       "\t<tr><td>Bottle-nosed dolphin</td><td>Cetacea       </td><td> 173.330</td><td> 5.2</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 33 × 4\n",
       "\\begin{tabular}{llll}\n",
       " name & order & bodywt & sleep\\_total\\\\\n",
       " <chr> & <chr> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t Cheetah              & Carnivora      &   50.000 & 12.1\\\\\n",
       "\t Owl monkey           & Primates       &    0.480 & 17.0\\\\\n",
       "\t Cow                  & Artiodactyla   &  600.000 &  4.0\\\\\n",
       "\t Northern fur seal    & Carnivora      &   20.490 &  8.7\\\\\n",
       "\t Goat                 & Artiodactyla   &   33.500 &  5.3\\\\\n",
       "\t Grivet               & Primates       &    4.750 & 10.0\\\\\n",
       "\t Asian elephant       & Proboscidea    & 2547.000 &  3.9\\\\\n",
       "\t Horse                & Perissodactyla &  521.000 &  2.9\\\\\n",
       "\t Donkey               & Perissodactyla &  187.000 &  3.1\\\\\n",
       "\t Patas monkey         & Primates       &   10.000 & 10.9\\\\\n",
       "\t Galago               & Primates       &    0.200 &  9.8\\\\\n",
       "\t Giraffe              & Artiodactyla   &  899.995 &  1.9\\\\\n",
       "\t Pilot whale          & Cetacea        &  800.000 &  2.7\\\\\n",
       "\t Gray seal            & Carnivora      &   85.000 &  6.2\\\\\n",
       "\t Human                & Primates       &   62.000 &  8.0\\\\\n",
       "\t Mongoose lemur       & Primates       &    1.670 &  9.5\\\\\n",
       "\t African elephant     & Proboscidea    & 6654.000 &  3.3\\\\\n",
       "\t Macaque              & Primates       &    6.800 & 10.1\\\\\n",
       "\t Slow loris           & Primates       &    1.400 & 11.0\\\\\n",
       "\t Sheep                & Artiodactyla   &   55.500 &  3.8\\\\\n",
       "\t Chimpanzee           & Primates       &   52.200 &  9.7\\\\\n",
       "\t Tiger                & Carnivora      &  162.564 & 15.8\\\\\n",
       "\t Jaguar               & Carnivora      &  100.000 & 10.4\\\\\n",
       "\t Lion                 & Carnivora      &  161.499 & 13.5\\\\\n",
       "\t Baboon               & Primates       &   25.235 &  9.4\\\\\n",
       "\t Potto                & Primates       &    1.100 & 11.0\\\\\n",
       "\t Caspian seal         & Carnivora      &   86.000 &  3.5\\\\\n",
       "\t Common porpoise      & Cetacea        &   53.180 &  5.6\\\\\n",
       "\t Giant armadillo      & Cingulata      &   60.000 & 18.1\\\\\n",
       "\t Squirrel monkey      & Primates       &    0.743 &  9.6\\\\\n",
       "\t Pig                  & Artiodactyla   &   86.250 &  9.1\\\\\n",
       "\t Brazilian tapir      & Perissodactyla &  207.501 &  4.4\\\\\n",
       "\t Bottle-nosed dolphin & Cetacea        &  173.330 &  5.2\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 33 × 4\n",
       "\n",
       "| name &lt;chr&gt; | order &lt;chr&gt; | bodywt &lt;dbl&gt; | sleep_total &lt;dbl&gt; |\n",
       "|---|---|---|---|\n",
       "| Cheetah              | Carnivora      |   50.000 | 12.1 |\n",
       "| Owl monkey           | Primates       |    0.480 | 17.0 |\n",
       "| Cow                  | Artiodactyla   |  600.000 |  4.0 |\n",
       "| Northern fur seal    | Carnivora      |   20.490 |  8.7 |\n",
       "| Goat                 | Artiodactyla   |   33.500 |  5.3 |\n",
       "| Grivet               | Primates       |    4.750 | 10.0 |\n",
       "| Asian elephant       | Proboscidea    | 2547.000 |  3.9 |\n",
       "| Horse                | Perissodactyla |  521.000 |  2.9 |\n",
       "| Donkey               | Perissodactyla |  187.000 |  3.1 |\n",
       "| Patas monkey         | Primates       |   10.000 | 10.9 |\n",
       "| Galago               | Primates       |    0.200 |  9.8 |\n",
       "| Giraffe              | Artiodactyla   |  899.995 |  1.9 |\n",
       "| Pilot whale          | Cetacea        |  800.000 |  2.7 |\n",
       "| Gray seal            | Carnivora      |   85.000 |  6.2 |\n",
       "| Human                | Primates       |   62.000 |  8.0 |\n",
       "| Mongoose lemur       | Primates       |    1.670 |  9.5 |\n",
       "| African elephant     | Proboscidea    | 6654.000 |  3.3 |\n",
       "| Macaque              | Primates       |    6.800 | 10.1 |\n",
       "| Slow loris           | Primates       |    1.400 | 11.0 |\n",
       "| Sheep                | Artiodactyla   |   55.500 |  3.8 |\n",
       "| Chimpanzee           | Primates       |   52.200 |  9.7 |\n",
       "| Tiger                | Carnivora      |  162.564 | 15.8 |\n",
       "| Jaguar               | Carnivora      |  100.000 | 10.4 |\n",
       "| Lion                 | Carnivora      |  161.499 | 13.5 |\n",
       "| Baboon               | Primates       |   25.235 |  9.4 |\n",
       "| Potto                | Primates       |    1.100 | 11.0 |\n",
       "| Caspian seal         | Carnivora      |   86.000 |  3.5 |\n",
       "| Common porpoise      | Cetacea        |   53.180 |  5.6 |\n",
       "| Giant armadillo      | Cingulata      |   60.000 | 18.1 |\n",
       "| Squirrel monkey      | Primates       |    0.743 |  9.6 |\n",
       "| Pig                  | Artiodactyla   |   86.250 |  9.1 |\n",
       "| Brazilian tapir      | Perissodactyla |  207.501 |  4.4 |\n",
       "| Bottle-nosed dolphin | Cetacea        |  173.330 |  5.2 |\n",
       "\n"
      ],
      "text/plain": [
       "   name                 order          bodywt   sleep_total\n",
       "1  Cheetah              Carnivora        50.000 12.1       \n",
       "2  Owl monkey           Primates          0.480 17.0       \n",
       "3  Cow                  Artiodactyla    600.000  4.0       \n",
       "4  Northern fur seal    Carnivora        20.490  8.7       \n",
       "5  Goat                 Artiodactyla     33.500  5.3       \n",
       "6  Grivet               Primates          4.750 10.0       \n",
       "7  Asian elephant       Proboscidea    2547.000  3.9       \n",
       "8  Horse                Perissodactyla  521.000  2.9       \n",
       "9  Donkey               Perissodactyla  187.000  3.1       \n",
       "10 Patas monkey         Primates         10.000 10.9       \n",
       "11 Galago               Primates          0.200  9.8       \n",
       "12 Giraffe              Artiodactyla    899.995  1.9       \n",
       "13 Pilot whale          Cetacea         800.000  2.7       \n",
       "14 Gray seal            Carnivora        85.000  6.2       \n",
       "15 Human                Primates         62.000  8.0       \n",
       "16 Mongoose lemur       Primates          1.670  9.5       \n",
       "17 African elephant     Proboscidea    6654.000  3.3       \n",
       "18 Macaque              Primates          6.800 10.1       \n",
       "19 Slow loris           Primates          1.400 11.0       \n",
       "20 Sheep                Artiodactyla     55.500  3.8       \n",
       "21 Chimpanzee           Primates         52.200  9.7       \n",
       "22 Tiger                Carnivora       162.564 15.8       \n",
       "23 Jaguar               Carnivora       100.000 10.4       \n",
       "24 Lion                 Carnivora       161.499 13.5       \n",
       "25 Baboon               Primates         25.235  9.4       \n",
       "26 Potto                Primates          1.100 11.0       \n",
       "27 Caspian seal         Carnivora        86.000  3.5       \n",
       "28 Common porpoise      Cetacea          53.180  5.6       \n",
       "29 Giant armadillo      Cingulata        60.000 18.1       \n",
       "30 Squirrel monkey      Primates          0.743  9.6       \n",
       "31 Pig                  Artiodactyla     86.250  9.1       \n",
       "32 Brazilian tapir      Perissodactyla  207.501  4.4       \n",
       "33 Bottle-nosed dolphin Cetacea         173.330  5.2       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "primates_or_heavy <- msleep %>% \n",
    "  select(name, order, bodywt, sleep_total) %>% \n",
    "  filter(order == \"Primates\" | bodywt > 20)\n",
    "\n",
    "primates_or_heavy"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "382e7c32",
   "metadata": {
    "papermill": {
     "duration": 0.007871,
     "end_time": "2025-12-22T15:09:38.160915",
     "exception": false,
     "start_time": "2025-12-22T15:09:38.153044",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### ব্যাখ্যা:\n",
    "* | হলো লজিক্যাল OR অপারেটর\n",
    "* যেকোনো একটি শর্ত পূরণ হলেই হবে\n",
    "* অর্থাৎ: Primates অর্ডারের প্রাণী অথবা ২০ কেজির বেশি ওজনের প্রাণী"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "8f198b4a",
   "metadata": {
    "papermill": {
     "duration": 0.008045,
     "end_time": "2025-12-22T15:09:38.176792",
     "exception": false,
     "start_time": "2025-12-22T15:09:38.168747",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "##  টিপ ৪: মাল্টিপল ভ্যালু ফিল্টারিং\n",
    "### ৪.১ একাধিকবার | ব্যবহার করে"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "e553995a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-12-22T15:09:38.196470Z",
     "iopub.status.busy": "2025-12-22T15:09:38.194694Z",
     "iopub.status.idle": "2025-12-22T15:09:38.225370Z",
     "shell.execute_reply": "2025-12-22T15:09:38.223402Z"
    },
    "papermill": {
     "duration": 0.043312,
     "end_time": "2025-12-22T15:09:38.227974",
     "exception": false,
     "start_time": "2025-12-22T15:09:38.184662",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 3 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>name</th><th scope=col>sleep_total</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Horse </td><td> 2.9</td></tr>\n",
       "\t<tr><td>Rabbit</td><td> 8.4</td></tr>\n",
       "\t<tr><td>Tiger </td><td>15.8</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 3 × 2\n",
       "\\begin{tabular}{ll}\n",
       " name & sleep\\_total\\\\\n",
       " <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t Horse  &  2.9\\\\\n",
       "\t Rabbit &  8.4\\\\\n",
       "\t Tiger  & 15.8\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 3 × 2\n",
       "\n",
       "| name &lt;chr&gt; | sleep_total &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| Horse  |  2.9 |\n",
       "| Rabbit |  8.4 |\n",
       "| Tiger  | 15.8 |\n",
       "\n"
      ],
      "text/plain": [
       "  name   sleep_total\n",
       "1 Horse   2.9       \n",
       "2 Rabbit  8.4       \n",
       "3 Tiger  15.8       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "specific_animals <- msleep %>% \n",
    "  select(name, sleep_total) %>% \n",
    "  filter(name == \"Rabbit\" |\n",
    "         name == \"Tiger\" |\n",
    "         name == \"Horse\")\n",
    "\n",
    "specific_animals"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "19a5236a",
   "metadata": {
    "papermill": {
     "duration": 0.008294,
     "end_time": "2025-12-22T15:09:38.244400",
     "exception": false,
     "start_time": "2025-12-22T15:09:38.236106",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### সমস্যা: অনেক নামের জন্য কোড লম্বা ও অসুবিধাজনক"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "8c789c68",
   "metadata": {
    "papermill": {
     "duration": 0.008145,
     "end_time": "2025-12-22T15:09:38.260507",
     "exception": false,
     "start_time": "2025-12-22T15:09:38.252362",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### ৪.২ %in% অপারেটর ব্যবহার (বেশি সুন্দর)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "522ea7a8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-12-22T15:09:38.280564Z",
     "iopub.status.busy": "2025-12-22T15:09:38.278902Z",
     "iopub.status.idle": "2025-12-22T15:09:38.309144Z",
     "shell.execute_reply": "2025-12-22T15:09:38.307372Z"
    },
    "papermill": {
     "duration": 0.043163,
     "end_time": "2025-12-22T15:09:38.311941",
     "exception": false,
     "start_time": "2025-12-22T15:09:38.268778",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 3 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>name</th><th scope=col>sleep_total</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Horse </td><td> 2.9</td></tr>\n",
       "\t<tr><td>Rabbit</td><td> 8.4</td></tr>\n",
       "\t<tr><td>Tiger </td><td>15.8</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 3 × 2\n",
       "\\begin{tabular}{ll}\n",
       " name & sleep\\_total\\\\\n",
       " <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t Horse  &  2.9\\\\\n",
       "\t Rabbit &  8.4\\\\\n",
       "\t Tiger  & 15.8\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 3 × 2\n",
       "\n",
       "| name &lt;chr&gt; | sleep_total &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| Horse  |  2.9 |\n",
       "| Rabbit |  8.4 |\n",
       "| Tiger  | 15.8 |\n",
       "\n"
      ],
      "text/plain": [
       "  name   sleep_total\n",
       "1 Horse   2.9       \n",
       "2 Rabbit  8.4       \n",
       "3 Tiger  15.8       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "specific_animals <- msleep %>% \n",
    "  select(name, sleep_total) %>% \n",
    "  filter(name %in% c(\"Rabbit\", \"Tiger\", \"Horse\"))\n",
    "\n",
    "specific_animals"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "9de2baa5",
   "metadata": {
    "papermill": {
     "duration": 0.008806,
     "end_time": "2025-12-22T15:09:38.329127",
     "exception": false,
     "start_time": "2025-12-22T15:09:38.320321",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### ব্যাখ্যা:\n",
    "* %in% চেক করে name ভেক্টরের মানগুলো c() ভেক্টরের মধ্যে আছে কিনা\n",
    "* অনেক বেশি নামের জন্য সহজ এবং পড়তে সুবিধা"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "aa11c644",
   "metadata": {
    "papermill": {
     "duration": 0.008347,
     "end_time": "2025-12-22T15:09:38.345888",
     "exception": false,
     "start_time": "2025-12-22T15:09:38.337541",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## টিপ ৫: রেঞ্জ ফিল্টারিং\n",
    "### ৫.১ between() ফাংশন ব্যবহার"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "43260520",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-12-22T15:09:38.365981Z",
     "iopub.status.busy": "2025-12-22T15:09:38.364403Z",
     "iopub.status.idle": "2025-12-22T15:09:38.408849Z",
     "shell.execute_reply": "2025-12-22T15:09:38.407091Z"
    },
    "papermill": {
     "duration": 0.057302,
     "end_time": "2025-12-22T15:09:38.411417",
     "exception": false,
     "start_time": "2025-12-22T15:09:38.354115",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 37 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>name</th><th scope=col>sleep_total</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Cheetah                       </td><td>12.1</td></tr>\n",
       "\t<tr><td>Mountain beaver               </td><td>14.4</td></tr>\n",
       "\t<tr><td>Greater short-tailed shrew    </td><td>14.9</td></tr>\n",
       "\t<tr><td>Three-toed sloth              </td><td>14.4</td></tr>\n",
       "\t<tr><td>Dog                           </td><td>10.1</td></tr>\n",
       "\t<tr><td>Grivet                        </td><td>10.0</td></tr>\n",
       "\t<tr><td>Chinchilla                    </td><td>12.5</td></tr>\n",
       "\t<tr><td>Star-nosed mole               </td><td>10.3</td></tr>\n",
       "\t<tr><td>European hedgehog             </td><td>10.1</td></tr>\n",
       "\t<tr><td>Patas monkey                  </td><td>10.9</td></tr>\n",
       "\t<tr><td>Western american chipmunk     </td><td>14.9</td></tr>\n",
       "\t<tr><td>Domestic cat                  </td><td>12.5</td></tr>\n",
       "\t<tr><td>Macaque                       </td><td>10.1</td></tr>\n",
       "\t<tr><td>Mongolian gerbil              </td><td>14.2</td></tr>\n",
       "\t<tr><td>Golden hamster                </td><td>14.3</td></tr>\n",
       "\t<tr><td>Vole                          </td><td>12.8</td></tr>\n",
       "\t<tr><td>House mouse                   </td><td>12.5</td></tr>\n",
       "\t<tr><td>Round-tailed muskrat          </td><td>14.6</td></tr>\n",
       "\t<tr><td>Slow loris                    </td><td>11.0</td></tr>\n",
       "\t<tr><td>Northern grasshopper mouse    </td><td>14.5</td></tr>\n",
       "\t<tr><td>Tiger                         </td><td>15.8</td></tr>\n",
       "\t<tr><td>Jaguar                        </td><td>10.4</td></tr>\n",
       "\t<tr><td>Lion                          </td><td>13.5</td></tr>\n",
       "\t<tr><td>Desert hedgehog               </td><td>10.3</td></tr>\n",
       "\t<tr><td>Potto                         </td><td>11.0</td></tr>\n",
       "\t<tr><td>Deer mouse                    </td><td>11.5</td></tr>\n",
       "\t<tr><td>Phalanger                     </td><td>13.7</td></tr>\n",
       "\t<tr><td>Potoroo                       </td><td>11.1</td></tr>\n",
       "\t<tr><td>Laboratory rat                </td><td>13.0</td></tr>\n",
       "\t<tr><td>Cotton rat                    </td><td>11.3</td></tr>\n",
       "\t<tr><td>Mole rat                      </td><td>10.6</td></tr>\n",
       "\t<tr><td>Thirteen-lined ground squirrel</td><td>13.8</td></tr>\n",
       "\t<tr><td>Golden-mantled ground squirrel</td><td>15.9</td></tr>\n",
       "\t<tr><td>Musk shrew                    </td><td>12.8</td></tr>\n",
       "\t<tr><td>Eastern american chipmunk     </td><td>15.8</td></tr>\n",
       "\t<tr><td>Tenrec                        </td><td>15.6</td></tr>\n",
       "\t<tr><td>Arctic fox                    </td><td>12.5</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 37 × 2\n",
       "\\begin{tabular}{ll}\n",
       " name & sleep\\_total\\\\\n",
       " <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t Cheetah                        & 12.1\\\\\n",
       "\t Mountain beaver                & 14.4\\\\\n",
       "\t Greater short-tailed shrew     & 14.9\\\\\n",
       "\t Three-toed sloth               & 14.4\\\\\n",
       "\t Dog                            & 10.1\\\\\n",
       "\t Grivet                         & 10.0\\\\\n",
       "\t Chinchilla                     & 12.5\\\\\n",
       "\t Star-nosed mole                & 10.3\\\\\n",
       "\t European hedgehog              & 10.1\\\\\n",
       "\t Patas monkey                   & 10.9\\\\\n",
       "\t Western american chipmunk      & 14.9\\\\\n",
       "\t Domestic cat                   & 12.5\\\\\n",
       "\t Macaque                        & 10.1\\\\\n",
       "\t Mongolian gerbil               & 14.2\\\\\n",
       "\t Golden hamster                 & 14.3\\\\\n",
       "\t Vole                           & 12.8\\\\\n",
       "\t House mouse                    & 12.5\\\\\n",
       "\t Round-tailed muskrat           & 14.6\\\\\n",
       "\t Slow loris                     & 11.0\\\\\n",
       "\t Northern grasshopper mouse     & 14.5\\\\\n",
       "\t Tiger                          & 15.8\\\\\n",
       "\t Jaguar                         & 10.4\\\\\n",
       "\t Lion                           & 13.5\\\\\n",
       "\t Desert hedgehog                & 10.3\\\\\n",
       "\t Potto                          & 11.0\\\\\n",
       "\t Deer mouse                     & 11.5\\\\\n",
       "\t Phalanger                      & 13.7\\\\\n",
       "\t Potoroo                        & 11.1\\\\\n",
       "\t Laboratory rat                 & 13.0\\\\\n",
       "\t Cotton rat                     & 11.3\\\\\n",
       "\t Mole rat                       & 10.6\\\\\n",
       "\t Thirteen-lined ground squirrel & 13.8\\\\\n",
       "\t Golden-mantled ground squirrel & 15.9\\\\\n",
       "\t Musk shrew                     & 12.8\\\\\n",
       "\t Eastern american chipmunk      & 15.8\\\\\n",
       "\t Tenrec                         & 15.6\\\\\n",
       "\t Arctic fox                     & 12.5\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 37 × 2\n",
       "\n",
       "| name &lt;chr&gt; | sleep_total &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| Cheetah                        | 12.1 |\n",
       "| Mountain beaver                | 14.4 |\n",
       "| Greater short-tailed shrew     | 14.9 |\n",
       "| Three-toed sloth               | 14.4 |\n",
       "| Dog                            | 10.1 |\n",
       "| Grivet                         | 10.0 |\n",
       "| Chinchilla                     | 12.5 |\n",
       "| Star-nosed mole                | 10.3 |\n",
       "| European hedgehog              | 10.1 |\n",
       "| Patas monkey                   | 10.9 |\n",
       "| Western american chipmunk      | 14.9 |\n",
       "| Domestic cat                   | 12.5 |\n",
       "| Macaque                        | 10.1 |\n",
       "| Mongolian gerbil               | 14.2 |\n",
       "| Golden hamster                 | 14.3 |\n",
       "| Vole                           | 12.8 |\n",
       "| House mouse                    | 12.5 |\n",
       "| Round-tailed muskrat           | 14.6 |\n",
       "| Slow loris                     | 11.0 |\n",
       "| Northern grasshopper mouse     | 14.5 |\n",
       "| Tiger                          | 15.8 |\n",
       "| Jaguar                         | 10.4 |\n",
       "| Lion                           | 13.5 |\n",
       "| Desert hedgehog                | 10.3 |\n",
       "| Potto                          | 11.0 |\n",
       "| Deer mouse                     | 11.5 |\n",
       "| Phalanger                      | 13.7 |\n",
       "| Potoroo                        | 11.1 |\n",
       "| Laboratory rat                 | 13.0 |\n",
       "| Cotton rat                     | 11.3 |\n",
       "| Mole rat                       | 10.6 |\n",
       "| Thirteen-lined ground squirrel | 13.8 |\n",
       "| Golden-mantled ground squirrel | 15.9 |\n",
       "| Musk shrew                     | 12.8 |\n",
       "| Eastern american chipmunk      | 15.8 |\n",
       "| Tenrec                         | 15.6 |\n",
       "| Arctic fox                     | 12.5 |\n",
       "\n"
      ],
      "text/plain": [
       "   name                           sleep_total\n",
       "1  Cheetah                        12.1       \n",
       "2  Mountain beaver                14.4       \n",
       "3  Greater short-tailed shrew     14.9       \n",
       "4  Three-toed sloth               14.4       \n",
       "5  Dog                            10.1       \n",
       "6  Grivet                         10.0       \n",
       "7  Chinchilla                     12.5       \n",
       "8  Star-nosed mole                10.3       \n",
       "9  European hedgehog              10.1       \n",
       "10 Patas monkey                   10.9       \n",
       "11 Western american chipmunk      14.9       \n",
       "12 Domestic cat                   12.5       \n",
       "13 Macaque                        10.1       \n",
       "14 Mongolian gerbil               14.2       \n",
       "15 Golden hamster                 14.3       \n",
       "16 Vole                           12.8       \n",
       "17 House mouse                    12.5       \n",
       "18 Round-tailed muskrat           14.6       \n",
       "19 Slow loris                     11.0       \n",
       "20 Northern grasshopper mouse     14.5       \n",
       "21 Tiger                          15.8       \n",
       "22 Jaguar                         10.4       \n",
       "23 Lion                           13.5       \n",
       "24 Desert hedgehog                10.3       \n",
       "25 Potto                          11.0       \n",
       "26 Deer mouse                     11.5       \n",
       "27 Phalanger                      13.7       \n",
       "28 Potoroo                        11.1       \n",
       "29 Laboratory rat                 13.0       \n",
       "30 Cotton rat                     11.3       \n",
       "31 Mole rat                       10.6       \n",
       "32 Thirteen-lined ground squirrel 13.8       \n",
       "33 Golden-mantled ground squirrel 15.9       \n",
       "34 Musk shrew                     12.8       \n",
       "35 Eastern american chipmunk      15.8       \n",
       "36 Tenrec                         15.6       \n",
       "37 Arctic fox                     12.5       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "moderate_sleepers <- msleep %>% \n",
    "  select(name, sleep_total) %>%\n",
    "  filter(between(sleep_total, 10, 16))\n",
    "\n",
    "moderate_sleepers"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "5b04cc8a",
   "metadata": {
    "papermill": {
     "duration": 0.008599,
     "end_time": "2025-12-22T15:09:38.428816",
     "exception": false,
     "start_time": "2025-12-22T15:09:38.420217",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### ব্যাখ্যা:\n",
    "* between(column, lower, upper) ফাংশন রেঞ্জ চেক করে\n",
    "* এখানে: 10 ≤ sleep_total ≤ 16\n",
    "* সীমার মানগুলো অন্তর্ভুক্ত করে (inclusive)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "00dbdb17",
   "metadata": {
    "papermill": {
     "duration": 0.009149,
     "end_time": "2025-12-22T15:09:38.446819",
     "exception": false,
     "start_time": "2025-12-22T15:09:38.437670",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### ৫.২ near() ফাংশন ব্যবহার (কাছাকাছি মান)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "860265e9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-12-22T15:09:38.467617Z",
     "iopub.status.busy": "2025-12-22T15:09:38.466068Z",
     "iopub.status.idle": "2025-12-22T15:09:38.497648Z",
     "shell.execute_reply": "2025-12-22T15:09:38.494852Z"
    },
    "papermill": {
     "duration": 0.04539,
     "end_time": "2025-12-22T15:09:38.500839",
     "exception": false,
     "start_time": "2025-12-22T15:09:38.455449",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 3 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>name</th><th scope=col>sleep_total</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Owl monkey            </td><td>17.0</td></tr>\n",
       "\t<tr><td>Long-nosed armadillo  </td><td>17.4</td></tr>\n",
       "\t<tr><td>Arctic ground squirrel</td><td>16.6</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 3 × 2\n",
       "\\begin{tabular}{ll}\n",
       " name & sleep\\_total\\\\\n",
       " <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t Owl monkey             & 17.0\\\\\n",
       "\t Long-nosed armadillo   & 17.4\\\\\n",
       "\t Arctic ground squirrel & 16.6\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 3 × 2\n",
       "\n",
       "| name &lt;chr&gt; | sleep_total &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| Owl monkey             | 17.0 |\n",
       "| Long-nosed armadillo   | 17.4 |\n",
       "| Arctic ground squirrel | 16.6 |\n",
       "\n"
      ],
      "text/plain": [
       "  name                   sleep_total\n",
       "1 Owl monkey             17.0       \n",
       "2 Long-nosed armadillo   17.4       \n",
       "3 Arctic ground squirrel 16.6       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "near_17 <- msleep %>% \n",
    "  select(name, sleep_total) %>%\n",
    "  filter(near(sleep_total, 17, tol = 0.5))\n",
    "\n",
    "near_17"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "61fc0a28",
   "metadata": {
    "papermill": {
     "duration": 0.00895,
     "end_time": "2025-12-22T15:09:38.521442",
     "exception": false,
     "start_time": "2025-12-22T15:09:38.512492",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### ব্যাখ্যা:\n",
    "* near(value, target, tol = tolerance)\n",
    "* tol = tolerance বা সহনশীলতা (ডিফল্ট 0.0000001)\n",
    "* এখানে: 16.5 ≤ sleep_total ≤ 17.5"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3699f35b",
   "metadata": {
    "papermill": {
     "duration": 0.009334,
     "end_time": "2025-12-22T15:09:38.539775",
     "exception": false,
     "start_time": "2025-12-22T15:09:38.530441",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## টিপ ৬: মিসিং ভ্যালু (NA) হ্যান্ডলিং\n",
    "### ৬.১ যেসব প্রাণীর conservation status জানা নেই"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "b733843c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-12-22T15:09:38.561325Z",
     "iopub.status.busy": "2025-12-22T15:09:38.559714Z",
     "iopub.status.idle": "2025-12-22T15:09:38.607024Z",
     "shell.execute_reply": "2025-12-22T15:09:38.604321Z"
    },
    "papermill": {
     "duration": 0.061442,
     "end_time": "2025-12-22T15:09:38.610170",
     "exception": false,
     "start_time": "2025-12-22T15:09:38.548728",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "\u001b[90m# A tibble: 29 × 3\u001b[39m\n",
      "   name                        conservation sleep_total\n",
      "   \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m                       \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m              \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m\n",
      "\u001b[90m 1\u001b[39m \u001b[90m\"\u001b[39mOwl monkey\u001b[90m\"\u001b[39m                \u001b[31mNA\u001b[39m                  17  \n",
      "\u001b[90m 2\u001b[39m \u001b[90m\"\u001b[39mThree-toed sloth\u001b[90m\"\u001b[39m          \u001b[31mNA\u001b[39m                  14.4\n",
      "\u001b[90m 3\u001b[39m \u001b[90m\"\u001b[39mVesper mouse\u001b[90m\"\u001b[39m              \u001b[31mNA\u001b[39m                   7  \n",
      "\u001b[90m 4\u001b[39m \u001b[90m\"\u001b[39mAfrican giant pouched rat\u001b[90m\"\u001b[39m \u001b[31mNA\u001b[39m                   8.3\n",
      "\u001b[90m 5\u001b[39m \u001b[90m\"\u001b[39mWestern american chipmunk\u001b[90m\"\u001b[39m \u001b[31mNA\u001b[39m                  14.9\n",
      "\u001b[90m 6\u001b[39m \u001b[90m\"\u001b[39mGalago\u001b[90m\"\u001b[39m                    \u001b[31mNA\u001b[39m                   9.8\n",
      "\u001b[90m 7\u001b[39m \u001b[90m\"\u001b[39mHuman\u001b[90m\"\u001b[39m                     \u001b[31mNA\u001b[39m                   8  \n",
      "\u001b[90m 8\u001b[39m \u001b[90m\"\u001b[39mMacaque\u001b[90m\"\u001b[39m                   \u001b[31mNA\u001b[39m                  10.1\n",
      "\u001b[90m 9\u001b[39m \u001b[90m\"\u001b[39mVole \u001b[90m\"\u001b[39m                     \u001b[31mNA\u001b[39m                  12.8\n",
      "\u001b[90m10\u001b[39m \u001b[90m\"\u001b[39mLittle brown bat\u001b[90m\"\u001b[39m          \u001b[31mNA\u001b[39m                  19.9\n",
      "\u001b[90m# ℹ 19 more rows\u001b[39m\n"
     ]
    }
   ],
   "source": [
    "unknown_conservation <- msleep %>% \n",
    "  select(name, conservation, sleep_total) %>%\n",
    "  filter(is.na(conservation))\n",
    "\n",
    "print(unknown_conservation)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "14947342",
   "metadata": {
    "papermill": {
     "duration": 0.00882,
     "end_time": "2025-12-22T15:09:38.628139",
     "exception": false,
     "start_time": "2025-12-22T15:09:38.619319",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### ব্যাখ্যা:\n",
    "* is.na() ফাংশন চেক করে ভ্যালু missing (NA) কিনা\n",
    "* conservation কলামে NA থাকলে সেই সারিগুলো ফিল্টার করবে"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "1a5dc8cc",
   "metadata": {
    "papermill": {
     "duration": 0.008922,
     "end_time": "2025-12-22T15:09:38.646773",
     "exception": false,
     "start_time": "2025-12-22T15:09:38.637851",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### ৬.২ যেসব প্রাণীর conservation status জানা আছে"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "f8015a22",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-12-22T15:09:38.668668Z",
     "iopub.status.busy": "2025-12-22T15:09:38.666967Z",
     "iopub.status.idle": "2025-12-22T15:09:38.728375Z",
     "shell.execute_reply": "2025-12-22T15:09:38.725657Z"
    },
    "papermill": {
     "duration": 0.075865,
     "end_time": "2025-12-22T15:09:38.731569",
     "exception": false,
     "start_time": "2025-12-22T15:09:38.655704",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 54 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>name</th><th scope=col>conservation</th><th scope=col>sleep_total</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Cheetah                       </td><td>lc          </td><td>12.1</td></tr>\n",
       "\t<tr><td>Mountain beaver               </td><td>nt          </td><td>14.4</td></tr>\n",
       "\t<tr><td>Greater short-tailed shrew    </td><td>lc          </td><td>14.9</td></tr>\n",
       "\t<tr><td>Cow                           </td><td>domesticated</td><td> 4.0</td></tr>\n",
       "\t<tr><td>Northern fur seal             </td><td>vu          </td><td> 8.7</td></tr>\n",
       "\t<tr><td>Dog                           </td><td>domesticated</td><td>10.1</td></tr>\n",
       "\t<tr><td>Roe deer                      </td><td>lc          </td><td> 3.0</td></tr>\n",
       "\t<tr><td>Goat                          </td><td>lc          </td><td> 5.3</td></tr>\n",
       "\t<tr><td>Guinea pig                    </td><td>domesticated</td><td> 9.4</td></tr>\n",
       "\t<tr><td>Grivet                        </td><td>lc          </td><td>10.0</td></tr>\n",
       "\t<tr><td>Chinchilla                    </td><td>domesticated</td><td>12.5</td></tr>\n",
       "\t<tr><td>Star-nosed mole               </td><td>lc          </td><td>10.3</td></tr>\n",
       "\t<tr><td>Lesser short-tailed shrew     </td><td>lc          </td><td> 9.1</td></tr>\n",
       "\t<tr><td>Long-nosed armadillo          </td><td>lc          </td><td>17.4</td></tr>\n",
       "\t<tr><td>Tree hyrax                    </td><td>lc          </td><td> 5.3</td></tr>\n",
       "\t<tr><td>North American Opossum        </td><td>lc          </td><td>18.0</td></tr>\n",
       "\t<tr><td>Asian elephant                </td><td>en          </td><td> 3.9</td></tr>\n",
       "\t<tr><td>Big brown bat                 </td><td>lc          </td><td>19.7</td></tr>\n",
       "\t<tr><td>Horse                         </td><td>domesticated</td><td> 2.9</td></tr>\n",
       "\t<tr><td>Donkey                        </td><td>domesticated</td><td> 3.1</td></tr>\n",
       "\t<tr><td>European hedgehog             </td><td>lc          </td><td>10.1</td></tr>\n",
       "\t<tr><td>Patas monkey                  </td><td>lc          </td><td>10.9</td></tr>\n",
       "\t<tr><td>Domestic cat                  </td><td>domesticated</td><td>12.5</td></tr>\n",
       "\t<tr><td>Giraffe                       </td><td>cd          </td><td> 1.9</td></tr>\n",
       "\t<tr><td>Pilot whale                   </td><td>cd          </td><td> 2.7</td></tr>\n",
       "\t<tr><td>Gray seal                     </td><td>lc          </td><td> 6.2</td></tr>\n",
       "\t<tr><td>Gray hyrax                    </td><td>lc          </td><td> 6.3</td></tr>\n",
       "\t<tr><td>Mongoose lemur                </td><td>vu          </td><td> 9.5</td></tr>\n",
       "\t<tr><td>African elephant              </td><td>vu          </td><td> 3.3</td></tr>\n",
       "\t<tr><td>Thick-tailed opposum          </td><td>lc          </td><td>19.4</td></tr>\n",
       "\t<tr><td>Mongolian gerbil              </td><td>lc          </td><td>14.2</td></tr>\n",
       "\t<tr><td>Golden hamster                </td><td>en          </td><td>14.3</td></tr>\n",
       "\t<tr><td>House mouse                   </td><td>nt          </td><td>12.5</td></tr>\n",
       "\t<tr><td>Round-tailed muskrat          </td><td>nt          </td><td>14.6</td></tr>\n",
       "\t<tr><td>Degu                          </td><td>lc          </td><td> 7.7</td></tr>\n",
       "\t<tr><td>Northern grasshopper mouse    </td><td>lc          </td><td>14.5</td></tr>\n",
       "\t<tr><td>Rabbit                        </td><td>domesticated</td><td> 8.4</td></tr>\n",
       "\t<tr><td>Sheep                         </td><td>domesticated</td><td> 3.8</td></tr>\n",
       "\t<tr><td>Tiger                         </td><td>en          </td><td>15.8</td></tr>\n",
       "\t<tr><td>Jaguar                        </td><td>nt          </td><td>10.4</td></tr>\n",
       "\t<tr><td>Lion                          </td><td>vu          </td><td>13.5</td></tr>\n",
       "\t<tr><td>Desert hedgehog               </td><td>lc          </td><td>10.3</td></tr>\n",
       "\t<tr><td>Potto                         </td><td>lc          </td><td>11.0</td></tr>\n",
       "\t<tr><td>Caspian seal                  </td><td>vu          </td><td> 3.5</td></tr>\n",
       "\t<tr><td>Common porpoise               </td><td>vu          </td><td> 5.6</td></tr>\n",
       "\t<tr><td>Giant armadillo               </td><td>en          </td><td>18.1</td></tr>\n",
       "\t<tr><td>Rock hyrax                    </td><td>lc          </td><td> 5.4</td></tr>\n",
       "\t<tr><td>Laboratory rat                </td><td>lc          </td><td>13.0</td></tr>\n",
       "\t<tr><td>Eastern american mole         </td><td>lc          </td><td> 8.4</td></tr>\n",
       "\t<tr><td>Arctic ground squirrel        </td><td>lc          </td><td>16.6</td></tr>\n",
       "\t<tr><td>Thirteen-lined ground squirrel</td><td>lc          </td><td>13.8</td></tr>\n",
       "\t<tr><td>Golden-mantled ground squirrel</td><td>lc          </td><td>15.9</td></tr>\n",
       "\t<tr><td>Pig                           </td><td>domesticated</td><td> 9.1</td></tr>\n",
       "\t<tr><td>Brazilian tapir               </td><td>vu          </td><td> 4.4</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 54 × 3\n",
       "\\begin{tabular}{lll}\n",
       " name & conservation & sleep\\_total\\\\\n",
       " <chr> & <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t Cheetah                        & lc           & 12.1\\\\\n",
       "\t Mountain beaver                & nt           & 14.4\\\\\n",
       "\t Greater short-tailed shrew     & lc           & 14.9\\\\\n",
       "\t Cow                            & domesticated &  4.0\\\\\n",
       "\t Northern fur seal              & vu           &  8.7\\\\\n",
       "\t Dog                            & domesticated & 10.1\\\\\n",
       "\t Roe deer                       & lc           &  3.0\\\\\n",
       "\t Goat                           & lc           &  5.3\\\\\n",
       "\t Guinea pig                     & domesticated &  9.4\\\\\n",
       "\t Grivet                         & lc           & 10.0\\\\\n",
       "\t Chinchilla                     & domesticated & 12.5\\\\\n",
       "\t Star-nosed mole                & lc           & 10.3\\\\\n",
       "\t Lesser short-tailed shrew      & lc           &  9.1\\\\\n",
       "\t Long-nosed armadillo           & lc           & 17.4\\\\\n",
       "\t Tree hyrax                     & lc           &  5.3\\\\\n",
       "\t North American Opossum         & lc           & 18.0\\\\\n",
       "\t Asian elephant                 & en           &  3.9\\\\\n",
       "\t Big brown bat                  & lc           & 19.7\\\\\n",
       "\t Horse                          & domesticated &  2.9\\\\\n",
       "\t Donkey                         & domesticated &  3.1\\\\\n",
       "\t European hedgehog              & lc           & 10.1\\\\\n",
       "\t Patas monkey                   & lc           & 10.9\\\\\n",
       "\t Domestic cat                   & domesticated & 12.5\\\\\n",
       "\t Giraffe                        & cd           &  1.9\\\\\n",
       "\t Pilot whale                    & cd           &  2.7\\\\\n",
       "\t Gray seal                      & lc           &  6.2\\\\\n",
       "\t Gray hyrax                     & lc           &  6.3\\\\\n",
       "\t Mongoose lemur                 & vu           &  9.5\\\\\n",
       "\t African elephant               & vu           &  3.3\\\\\n",
       "\t Thick-tailed opposum           & lc           & 19.4\\\\\n",
       "\t Mongolian gerbil               & lc           & 14.2\\\\\n",
       "\t Golden hamster                 & en           & 14.3\\\\\n",
       "\t House mouse                    & nt           & 12.5\\\\\n",
       "\t Round-tailed muskrat           & nt           & 14.6\\\\\n",
       "\t Degu                           & lc           &  7.7\\\\\n",
       "\t Northern grasshopper mouse     & lc           & 14.5\\\\\n",
       "\t Rabbit                         & domesticated &  8.4\\\\\n",
       "\t Sheep                          & domesticated &  3.8\\\\\n",
       "\t Tiger                          & en           & 15.8\\\\\n",
       "\t Jaguar                         & nt           & 10.4\\\\\n",
       "\t Lion                           & vu           & 13.5\\\\\n",
       "\t Desert hedgehog                & lc           & 10.3\\\\\n",
       "\t Potto                          & lc           & 11.0\\\\\n",
       "\t Caspian seal                   & vu           &  3.5\\\\\n",
       "\t Common porpoise                & vu           &  5.6\\\\\n",
       "\t Giant armadillo                & en           & 18.1\\\\\n",
       "\t Rock hyrax                     & lc           &  5.4\\\\\n",
       "\t Laboratory rat                 & lc           & 13.0\\\\\n",
       "\t Eastern american mole          & lc           &  8.4\\\\\n",
       "\t Arctic ground squirrel         & lc           & 16.6\\\\\n",
       "\t Thirteen-lined ground squirrel & lc           & 13.8\\\\\n",
       "\t Golden-mantled ground squirrel & lc           & 15.9\\\\\n",
       "\t Pig                            & domesticated &  9.1\\\\\n",
       "\t Brazilian tapir                & vu           &  4.4\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 54 × 3\n",
       "\n",
       "| name &lt;chr&gt; | conservation &lt;chr&gt; | sleep_total &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| Cheetah                        | lc           | 12.1 |\n",
       "| Mountain beaver                | nt           | 14.4 |\n",
       "| Greater short-tailed shrew     | lc           | 14.9 |\n",
       "| Cow                            | domesticated |  4.0 |\n",
       "| Northern fur seal              | vu           |  8.7 |\n",
       "| Dog                            | domesticated | 10.1 |\n",
       "| Roe deer                       | lc           |  3.0 |\n",
       "| Goat                           | lc           |  5.3 |\n",
       "| Guinea pig                     | domesticated |  9.4 |\n",
       "| Grivet                         | lc           | 10.0 |\n",
       "| Chinchilla                     | domesticated | 12.5 |\n",
       "| Star-nosed mole                | lc           | 10.3 |\n",
       "| Lesser short-tailed shrew      | lc           |  9.1 |\n",
       "| Long-nosed armadillo           | lc           | 17.4 |\n",
       "| Tree hyrax                     | lc           |  5.3 |\n",
       "| North American Opossum         | lc           | 18.0 |\n",
       "| Asian elephant                 | en           |  3.9 |\n",
       "| Big brown bat                  | lc           | 19.7 |\n",
       "| Horse                          | domesticated |  2.9 |\n",
       "| Donkey                         | domesticated |  3.1 |\n",
       "| European hedgehog              | lc           | 10.1 |\n",
       "| Patas monkey                   | lc           | 10.9 |\n",
       "| Domestic cat                   | domesticated | 12.5 |\n",
       "| Giraffe                        | cd           |  1.9 |\n",
       "| Pilot whale                    | cd           |  2.7 |\n",
       "| Gray seal                      | lc           |  6.2 |\n",
       "| Gray hyrax                     | lc           |  6.3 |\n",
       "| Mongoose lemur                 | vu           |  9.5 |\n",
       "| African elephant               | vu           |  3.3 |\n",
       "| Thick-tailed opposum           | lc           | 19.4 |\n",
       "| Mongolian gerbil               | lc           | 14.2 |\n",
       "| Golden hamster                 | en           | 14.3 |\n",
       "| House mouse                    | nt           | 12.5 |\n",
       "| Round-tailed muskrat           | nt           | 14.6 |\n",
       "| Degu                           | lc           |  7.7 |\n",
       "| Northern grasshopper mouse     | lc           | 14.5 |\n",
       "| Rabbit                         | domesticated |  8.4 |\n",
       "| Sheep                          | domesticated |  3.8 |\n",
       "| Tiger                          | en           | 15.8 |\n",
       "| Jaguar                         | nt           | 10.4 |\n",
       "| Lion                           | vu           | 13.5 |\n",
       "| Desert hedgehog                | lc           | 10.3 |\n",
       "| Potto                          | lc           | 11.0 |\n",
       "| Caspian seal                   | vu           |  3.5 |\n",
       "| Common porpoise                | vu           |  5.6 |\n",
       "| Giant armadillo                | en           | 18.1 |\n",
       "| Rock hyrax                     | lc           |  5.4 |\n",
       "| Laboratory rat                 | lc           | 13.0 |\n",
       "| Eastern american mole          | lc           |  8.4 |\n",
       "| Arctic ground squirrel         | lc           | 16.6 |\n",
       "| Thirteen-lined ground squirrel | lc           | 13.8 |\n",
       "| Golden-mantled ground squirrel | lc           | 15.9 |\n",
       "| Pig                            | domesticated |  9.1 |\n",
       "| Brazilian tapir                | vu           |  4.4 |\n",
       "\n"
      ],
      "text/plain": [
       "   name                           conservation sleep_total\n",
       "1  Cheetah                        lc           12.1       \n",
       "2  Mountain beaver                nt           14.4       \n",
       "3  Greater short-tailed shrew     lc           14.9       \n",
       "4  Cow                            domesticated  4.0       \n",
       "5  Northern fur seal              vu            8.7       \n",
       "6  Dog                            domesticated 10.1       \n",
       "7  Roe deer                       lc            3.0       \n",
       "8  Goat                           lc            5.3       \n",
       "9  Guinea pig                     domesticated  9.4       \n",
       "10 Grivet                         lc           10.0       \n",
       "11 Chinchilla                     domesticated 12.5       \n",
       "12 Star-nosed mole                lc           10.3       \n",
       "13 Lesser short-tailed shrew      lc            9.1       \n",
       "14 Long-nosed armadillo           lc           17.4       \n",
       "15 Tree hyrax                     lc            5.3       \n",
       "16 North American Opossum         lc           18.0       \n",
       "17 Asian elephant                 en            3.9       \n",
       "18 Big brown bat                  lc           19.7       \n",
       "19 Horse                          domesticated  2.9       \n",
       "20 Donkey                         domesticated  3.1       \n",
       "21 European hedgehog              lc           10.1       \n",
       "22 Patas monkey                   lc           10.9       \n",
       "23 Domestic cat                   domesticated 12.5       \n",
       "24 Giraffe                        cd            1.9       \n",
       "25 Pilot whale                    cd            2.7       \n",
       "26 Gray seal                      lc            6.2       \n",
       "27 Gray hyrax                     lc            6.3       \n",
       "28 Mongoose lemur                 vu            9.5       \n",
       "29 African elephant               vu            3.3       \n",
       "30 Thick-tailed opposum           lc           19.4       \n",
       "31 Mongolian gerbil               lc           14.2       \n",
       "32 Golden hamster                 en           14.3       \n",
       "33 House mouse                    nt           12.5       \n",
       "34 Round-tailed muskrat           nt           14.6       \n",
       "35 Degu                           lc            7.7       \n",
       "36 Northern grasshopper mouse     lc           14.5       \n",
       "37 Rabbit                         domesticated  8.4       \n",
       "38 Sheep                          domesticated  3.8       \n",
       "39 Tiger                          en           15.8       \n",
       "40 Jaguar                         nt           10.4       \n",
       "41 Lion                           vu           13.5       \n",
       "42 Desert hedgehog                lc           10.3       \n",
       "43 Potto                          lc           11.0       \n",
       "44 Caspian seal                   vu            3.5       \n",
       "45 Common porpoise                vu            5.6       \n",
       "46 Giant armadillo                en           18.1       \n",
       "47 Rock hyrax                     lc            5.4       \n",
       "48 Laboratory rat                 lc           13.0       \n",
       "49 Eastern american mole          lc            8.4       \n",
       "50 Arctic ground squirrel         lc           16.6       \n",
       "51 Thirteen-lined ground squirrel lc           13.8       \n",
       "52 Golden-mantled ground squirrel lc           15.9       \n",
       "53 Pig                            domesticated  9.1       \n",
       "54 Brazilian tapir                vu            4.4       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "known_conservation <- msleep %>% \n",
    "  select(name, conservation, sleep_total) %>%\n",
    "  filter(!is.na(conservation))\n",
    "\n",
    "known_conservation"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "edb7af01",
   "metadata": {
    "papermill": {
     "duration": 0.009463,
     "end_time": "2025-12-22T15:09:38.750586",
     "exception": false,
     "start_time": "2025-12-22T15:09:38.741123",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### ব্যাখ্যা:\n",
    "* !is.na() মানে \"NOT missing\"\n",
    "* conservation কলামে যেসব প্রাণীর তথ্য আছে শুধু সেগুলোই রাখবে"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "7cf2fc9d",
   "metadata": {
    "papermill": {
     "duration": 0.009335,
     "end_time": "2025-12-22T15:09:38.769538",
     "exception": false,
     "start_time": "2025-12-22T15:09:38.760203",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## প্রাকটিক্যাল উদাহরণ"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "0906918f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-12-22T15:09:38.792837Z",
     "iopub.status.busy": "2025-12-22T15:09:38.790960Z",
     "iopub.status.idle": "2025-12-22T15:09:38.844587Z",
     "shell.execute_reply": "2025-12-22T15:09:38.842180Z"
    },
    "papermill": {
     "duration": 0.069182,
     "end_time": "2025-12-22T15:09:38.848052",
     "exception": false,
     "start_time": "2025-12-22T15:09:38.778870",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 13 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>name</th><th scope=col>vore</th><th scope=col>bodywt</th><th scope=col>sleep_total</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>African elephant    </td><td>herbi</td><td>6654.000</td><td>3.3</td></tr>\n",
       "\t<tr><td>Asian elephant      </td><td>herbi</td><td>2547.000</td><td>3.9</td></tr>\n",
       "\t<tr><td>Giraffe             </td><td>herbi</td><td> 899.995</td><td>1.9</td></tr>\n",
       "\t<tr><td>Pilot whale         </td><td>carni</td><td> 800.000</td><td>2.7</td></tr>\n",
       "\t<tr><td>Cow                 </td><td>herbi</td><td> 600.000</td><td>4.0</td></tr>\n",
       "\t<tr><td>Horse               </td><td>herbi</td><td> 521.000</td><td>2.9</td></tr>\n",
       "\t<tr><td>Brazilian tapir     </td><td>herbi</td><td> 207.501</td><td>4.4</td></tr>\n",
       "\t<tr><td>Donkey              </td><td>herbi</td><td> 187.000</td><td>3.1</td></tr>\n",
       "\t<tr><td>Bottle-nosed dolphin</td><td>carni</td><td> 173.330</td><td>5.2</td></tr>\n",
       "\t<tr><td>Caspian seal        </td><td>carni</td><td>  86.000</td><td>3.5</td></tr>\n",
       "\t<tr><td>Gray seal           </td><td>carni</td><td>  85.000</td><td>6.2</td></tr>\n",
       "\t<tr><td>Sheep               </td><td>herbi</td><td>  55.500</td><td>3.8</td></tr>\n",
       "\t<tr><td>Common porpoise     </td><td>carni</td><td>  53.180</td><td>5.6</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 13 × 4\n",
       "\\begin{tabular}{llll}\n",
       " name & vore & bodywt & sleep\\_total\\\\\n",
       " <chr> & <chr> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t African elephant     & herbi & 6654.000 & 3.3\\\\\n",
       "\t Asian elephant       & herbi & 2547.000 & 3.9\\\\\n",
       "\t Giraffe              & herbi &  899.995 & 1.9\\\\\n",
       "\t Pilot whale          & carni &  800.000 & 2.7\\\\\n",
       "\t Cow                  & herbi &  600.000 & 4.0\\\\\n",
       "\t Horse                & herbi &  521.000 & 2.9\\\\\n",
       "\t Brazilian tapir      & herbi &  207.501 & 4.4\\\\\n",
       "\t Donkey               & herbi &  187.000 & 3.1\\\\\n",
       "\t Bottle-nosed dolphin & carni &  173.330 & 5.2\\\\\n",
       "\t Caspian seal         & carni &   86.000 & 3.5\\\\\n",
       "\t Gray seal            & carni &   85.000 & 6.2\\\\\n",
       "\t Sheep                & herbi &   55.500 & 3.8\\\\\n",
       "\t Common porpoise      & carni &   53.180 & 5.6\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 13 × 4\n",
       "\n",
       "| name &lt;chr&gt; | vore &lt;chr&gt; | bodywt &lt;dbl&gt; | sleep_total &lt;dbl&gt; |\n",
       "|---|---|---|---|\n",
       "| African elephant     | herbi | 6654.000 | 3.3 |\n",
       "| Asian elephant       | herbi | 2547.000 | 3.9 |\n",
       "| Giraffe              | herbi |  899.995 | 1.9 |\n",
       "| Pilot whale          | carni |  800.000 | 2.7 |\n",
       "| Cow                  | herbi |  600.000 | 4.0 |\n",
       "| Horse                | herbi |  521.000 | 2.9 |\n",
       "| Brazilian tapir      | herbi |  207.501 | 4.4 |\n",
       "| Donkey               | herbi |  187.000 | 3.1 |\n",
       "| Bottle-nosed dolphin | carni |  173.330 | 5.2 |\n",
       "| Caspian seal         | carni |   86.000 | 3.5 |\n",
       "| Gray seal            | carni |   85.000 | 6.2 |\n",
       "| Sheep                | herbi |   55.500 | 3.8 |\n",
       "| Common porpoise      | carni |   53.180 | 5.6 |\n",
       "\n"
      ],
      "text/plain": [
       "   name                 vore  bodywt   sleep_total\n",
       "1  African elephant     herbi 6654.000 3.3        \n",
       "2  Asian elephant       herbi 2547.000 3.9        \n",
       "3  Giraffe              herbi  899.995 1.9        \n",
       "4  Pilot whale          carni  800.000 2.7        \n",
       "5  Cow                  herbi  600.000 4.0        \n",
       "6  Horse                herbi  521.000 2.9        \n",
       "7  Brazilian tapir      herbi  207.501 4.4        \n",
       "8  Donkey               herbi  187.000 3.1        \n",
       "9  Bottle-nosed dolphin carni  173.330 5.2        \n",
       "10 Caspian seal         carni   86.000 3.5        \n",
       "11 Gray seal            carni   85.000 6.2        \n",
       "12 Sheep                herbi   55.500 3.8        \n",
       "13 Common porpoise      carni   53.180 5.6        "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# প্র্যাকটিস: বিভিন্ন ফিল্টার একসাথে\n",
    "library(tidyverse)\n",
    "\n",
    "# উদাহরণ ১: ভারী ও কম ঘুমানো প্রাণী\n",
    "heavy_light_sleepers <- msleep %>%\n",
    "  select(name, vore, bodywt, sleep_total) %>%\n",
    "  filter(bodywt > 50, sleep_total < 8) %>%\n",
    "  arrange(desc(bodywt))\n",
    "\n",
    "heavy_light_sleepers"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "c9698fe7",
   "metadata": {
    "collapsed": true,
    "execution": {
     "iopub.execute_input": "2025-12-22T15:09:38.871038Z",
     "iopub.status.busy": "2025-12-22T15:09:38.869423Z",
     "iopub.status.idle": "2025-12-22T15:09:38.941240Z",
     "shell.execute_reply": "2025-12-22T15:09:38.938502Z"
    },
    "jupyter": {
     "outputs_hidden": true
    },
    "papermill": {
     "duration": 0.086794,
     "end_time": "2025-12-22T15:09:38.944506",
     "exception": false,
     "start_time": "2025-12-22T15:09:38.857712",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 28 × 11</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>name</th><th scope=col>genus</th><th scope=col>vore</th><th scope=col>order</th><th scope=col>conservation</th><th scope=col>sleep_total</th><th scope=col>sleep_rem</th><th scope=col>sleep_cycle</th><th scope=col>awake</th><th scope=col>brainwt</th><th scope=col>bodywt</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Cheetah                       </td><td>Acinonyx    </td><td>carni</td><td>Carnivora      </td><td>lc          </td><td>12.1</td><td> NA</td><td>       NA</td><td>11.9</td><td>     NA</td><td> 50.000</td></tr>\n",
       "\t<tr><td>Mountain beaver               </td><td>Aplodontia  </td><td>herbi</td><td>Rodentia       </td><td>nt          </td><td>14.4</td><td>2.4</td><td>       NA</td><td> 9.6</td><td>     NA</td><td>  1.350</td></tr>\n",
       "\t<tr><td>Cow                           </td><td>Bos         </td><td>herbi</td><td>Artiodactyla   </td><td>domesticated</td><td> 4.0</td><td>0.7</td><td>0.6666667</td><td>20.0</td><td>0.42300</td><td>600.000</td></tr>\n",
       "\t<tr><td>Dog                           </td><td>Canis       </td><td>carni</td><td>Carnivora      </td><td>domesticated</td><td>10.1</td><td>2.9</td><td>0.3333333</td><td>13.9</td><td>0.07000</td><td> 14.000</td></tr>\n",
       "\t<tr><td>Roe deer                      </td><td>Capreolus   </td><td>herbi</td><td>Artiodactyla   </td><td>lc          </td><td> 3.0</td><td> NA</td><td>       NA</td><td>21.0</td><td>0.09820</td><td> 14.800</td></tr>\n",
       "\t<tr><td>Goat                          </td><td>Capri       </td><td>herbi</td><td>Artiodactyla   </td><td>lc          </td><td> 5.3</td><td>0.6</td><td>       NA</td><td>18.7</td><td>0.11500</td><td> 33.500</td></tr>\n",
       "\t<tr><td>Guinea pig                    </td><td>Cavis       </td><td>herbi</td><td>Rodentia       </td><td>domesticated</td><td> 9.4</td><td>0.8</td><td>0.2166667</td><td>14.6</td><td>0.00550</td><td>  0.728</td></tr>\n",
       "\t<tr><td>Chinchilla                    </td><td>Chinchilla  </td><td>herbi</td><td>Rodentia       </td><td>domesticated</td><td>12.5</td><td>1.5</td><td>0.1166667</td><td>11.5</td><td>0.00640</td><td>  0.420</td></tr>\n",
       "\t<tr><td>Long-nosed armadillo          </td><td>Dasypus     </td><td>carni</td><td>Cingulata      </td><td>lc          </td><td>17.4</td><td>3.1</td><td>0.3833333</td><td> 6.6</td><td>0.01080</td><td>  3.500</td></tr>\n",
       "\t<tr><td>Tree hyrax                    </td><td>Dendrohyrax </td><td>herbi</td><td>Hyracoidea     </td><td>lc          </td><td> 5.3</td><td>0.5</td><td>       NA</td><td>18.7</td><td>0.01230</td><td>  2.950</td></tr>\n",
       "\t<tr><td>Horse                         </td><td>Equus       </td><td>herbi</td><td>Perissodactyla </td><td>domesticated</td><td> 2.9</td><td>0.6</td><td>1.0000000</td><td>21.1</td><td>0.65500</td><td>521.000</td></tr>\n",
       "\t<tr><td>Donkey                        </td><td>Equus       </td><td>herbi</td><td>Perissodactyla </td><td>domesticated</td><td> 3.1</td><td>0.4</td><td>       NA</td><td>20.9</td><td>0.41900</td><td>187.000</td></tr>\n",
       "\t<tr><td>Domestic cat                  </td><td>Felis       </td><td>carni</td><td>Carnivora      </td><td>domesticated</td><td>12.5</td><td>3.2</td><td>0.4166667</td><td>11.5</td><td>0.02560</td><td>  3.300</td></tr>\n",
       "\t<tr><td>Gray seal                     </td><td>Haliochoerus</td><td>carni</td><td>Carnivora      </td><td>lc          </td><td> 6.2</td><td>1.5</td><td>       NA</td><td>17.8</td><td>0.32500</td><td> 85.000</td></tr>\n",
       "\t<tr><td>Gray hyrax                    </td><td>Heterohyrax </td><td>herbi</td><td>Hyracoidea     </td><td>lc          </td><td> 6.3</td><td>0.6</td><td>       NA</td><td>17.7</td><td>0.01227</td><td>  2.625</td></tr>\n",
       "\t<tr><td>Thick-tailed opposum          </td><td>Lutreolina  </td><td>carni</td><td>Didelphimorphia</td><td>lc          </td><td>19.4</td><td>6.6</td><td>       NA</td><td> 4.6</td><td>     NA</td><td>  0.370</td></tr>\n",
       "\t<tr><td>Mongolian gerbil              </td><td>Meriones    </td><td>herbi</td><td>Rodentia       </td><td>lc          </td><td>14.2</td><td>1.9</td><td>       NA</td><td> 9.8</td><td>     NA</td><td>  0.053</td></tr>\n",
       "\t<tr><td>House mouse                   </td><td>Mus         </td><td>herbi</td><td>Rodentia       </td><td>nt          </td><td>12.5</td><td>1.4</td><td>0.1833333</td><td>11.5</td><td>0.00040</td><td>  0.022</td></tr>\n",
       "\t<tr><td>Round-tailed muskrat          </td><td>Neofiber    </td><td>herbi</td><td>Rodentia       </td><td>nt          </td><td>14.6</td><td> NA</td><td>       NA</td><td> 9.4</td><td>     NA</td><td>  0.266</td></tr>\n",
       "\t<tr><td>Degu                          </td><td>Octodon     </td><td>herbi</td><td>Rodentia       </td><td>lc          </td><td> 7.7</td><td>0.9</td><td>       NA</td><td>16.3</td><td>     NA</td><td>  0.210</td></tr>\n",
       "\t<tr><td>Northern grasshopper mouse    </td><td>Onychomys   </td><td>carni</td><td>Rodentia       </td><td>lc          </td><td>14.5</td><td> NA</td><td>       NA</td><td> 9.5</td><td>     NA</td><td>  0.028</td></tr>\n",
       "\t<tr><td>Rabbit                        </td><td>Oryctolagus </td><td>herbi</td><td>Lagomorpha     </td><td>domesticated</td><td> 8.4</td><td>0.9</td><td>0.4166667</td><td>15.6</td><td>0.01210</td><td>  2.500</td></tr>\n",
       "\t<tr><td>Sheep                         </td><td>Ovis        </td><td>herbi</td><td>Artiodactyla   </td><td>domesticated</td><td> 3.8</td><td>0.6</td><td>       NA</td><td>20.2</td><td>0.17500</td><td> 55.500</td></tr>\n",
       "\t<tr><td>Jaguar                        </td><td>Panthera    </td><td>carni</td><td>Carnivora      </td><td>nt          </td><td>10.4</td><td> NA</td><td>       NA</td><td>13.6</td><td>0.15700</td><td>100.000</td></tr>\n",
       "\t<tr><td>Laboratory rat                </td><td>Rattus      </td><td>herbi</td><td>Rodentia       </td><td>lc          </td><td>13.0</td><td>2.4</td><td>0.1833333</td><td>11.0</td><td>0.00190</td><td>  0.320</td></tr>\n",
       "\t<tr><td>Arctic ground squirrel        </td><td>Spermophilus</td><td>herbi</td><td>Rodentia       </td><td>lc          </td><td>16.6</td><td> NA</td><td>       NA</td><td> 7.4</td><td>0.00570</td><td>  0.920</td></tr>\n",
       "\t<tr><td>Thirteen-lined ground squirrel</td><td>Spermophilus</td><td>herbi</td><td>Rodentia       </td><td>lc          </td><td>13.8</td><td>3.4</td><td>0.2166667</td><td>10.2</td><td>0.00400</td><td>  0.101</td></tr>\n",
       "\t<tr><td>Golden-mantled ground squirrel</td><td>Spermophilus</td><td>herbi</td><td>Rodentia       </td><td>lc          </td><td>15.9</td><td>3.0</td><td>       NA</td><td> 8.1</td><td>     NA</td><td>  0.205</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 28 × 11\n",
       "\\begin{tabular}{lllllllllll}\n",
       " name & genus & vore & order & conservation & sleep\\_total & sleep\\_rem & sleep\\_cycle & awake & brainwt & bodywt\\\\\n",
       " <chr> & <chr> & <chr> & <chr> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t Cheetah                        & Acinonyx     & carni & Carnivora       & lc           & 12.1 &  NA &        NA & 11.9 &      NA &  50.000\\\\\n",
       "\t Mountain beaver                & Aplodontia   & herbi & Rodentia        & nt           & 14.4 & 2.4 &        NA &  9.6 &      NA &   1.350\\\\\n",
       "\t Cow                            & Bos          & herbi & Artiodactyla    & domesticated &  4.0 & 0.7 & 0.6666667 & 20.0 & 0.42300 & 600.000\\\\\n",
       "\t Dog                            & Canis        & carni & Carnivora       & domesticated & 10.1 & 2.9 & 0.3333333 & 13.9 & 0.07000 &  14.000\\\\\n",
       "\t Roe deer                       & Capreolus    & herbi & Artiodactyla    & lc           &  3.0 &  NA &        NA & 21.0 & 0.09820 &  14.800\\\\\n",
       "\t Goat                           & Capri        & herbi & Artiodactyla    & lc           &  5.3 & 0.6 &        NA & 18.7 & 0.11500 &  33.500\\\\\n",
       "\t Guinea pig                     & Cavis        & herbi & Rodentia        & domesticated &  9.4 & 0.8 & 0.2166667 & 14.6 & 0.00550 &   0.728\\\\\n",
       "\t Chinchilla                     & Chinchilla   & herbi & Rodentia        & domesticated & 12.5 & 1.5 & 0.1166667 & 11.5 & 0.00640 &   0.420\\\\\n",
       "\t Long-nosed armadillo           & Dasypus      & carni & Cingulata       & lc           & 17.4 & 3.1 & 0.3833333 &  6.6 & 0.01080 &   3.500\\\\\n",
       "\t Tree hyrax                     & Dendrohyrax  & herbi & Hyracoidea      & lc           &  5.3 & 0.5 &        NA & 18.7 & 0.01230 &   2.950\\\\\n",
       "\t Horse                          & Equus        & herbi & Perissodactyla  & domesticated &  2.9 & 0.6 & 1.0000000 & 21.1 & 0.65500 & 521.000\\\\\n",
       "\t Donkey                         & Equus        & herbi & Perissodactyla  & domesticated &  3.1 & 0.4 &        NA & 20.9 & 0.41900 & 187.000\\\\\n",
       "\t Domestic cat                   & Felis        & carni & Carnivora       & domesticated & 12.5 & 3.2 & 0.4166667 & 11.5 & 0.02560 &   3.300\\\\\n",
       "\t Gray seal                      & Haliochoerus & carni & Carnivora       & lc           &  6.2 & 1.5 &        NA & 17.8 & 0.32500 &  85.000\\\\\n",
       "\t Gray hyrax                     & Heterohyrax  & herbi & Hyracoidea      & lc           &  6.3 & 0.6 &        NA & 17.7 & 0.01227 &   2.625\\\\\n",
       "\t Thick-tailed opposum           & Lutreolina   & carni & Didelphimorphia & lc           & 19.4 & 6.6 &        NA &  4.6 &      NA &   0.370\\\\\n",
       "\t Mongolian gerbil               & Meriones     & herbi & Rodentia        & lc           & 14.2 & 1.9 &        NA &  9.8 &      NA &   0.053\\\\\n",
       "\t House mouse                    & Mus          & herbi & Rodentia        & nt           & 12.5 & 1.4 & 0.1833333 & 11.5 & 0.00040 &   0.022\\\\\n",
       "\t Round-tailed muskrat           & Neofiber     & herbi & Rodentia        & nt           & 14.6 &  NA &        NA &  9.4 &      NA &   0.266\\\\\n",
       "\t Degu                           & Octodon      & herbi & Rodentia        & lc           &  7.7 & 0.9 &        NA & 16.3 &      NA &   0.210\\\\\n",
       "\t Northern grasshopper mouse     & Onychomys    & carni & Rodentia        & lc           & 14.5 &  NA &        NA &  9.5 &      NA &   0.028\\\\\n",
       "\t Rabbit                         & Oryctolagus  & herbi & Lagomorpha      & domesticated &  8.4 & 0.9 & 0.4166667 & 15.6 & 0.01210 &   2.500\\\\\n",
       "\t Sheep                          & Ovis         & herbi & Artiodactyla    & domesticated &  3.8 & 0.6 &        NA & 20.2 & 0.17500 &  55.500\\\\\n",
       "\t Jaguar                         & Panthera     & carni & Carnivora       & nt           & 10.4 &  NA &        NA & 13.6 & 0.15700 & 100.000\\\\\n",
       "\t Laboratory rat                 & Rattus       & herbi & Rodentia        & lc           & 13.0 & 2.4 & 0.1833333 & 11.0 & 0.00190 &   0.320\\\\\n",
       "\t Arctic ground squirrel         & Spermophilus & herbi & Rodentia        & lc           & 16.6 &  NA &        NA &  7.4 & 0.00570 &   0.920\\\\\n",
       "\t Thirteen-lined ground squirrel & Spermophilus & herbi & Rodentia        & lc           & 13.8 & 3.4 & 0.2166667 & 10.2 & 0.00400 &   0.101\\\\\n",
       "\t Golden-mantled ground squirrel & Spermophilus & herbi & Rodentia        & lc           & 15.9 & 3.0 &        NA &  8.1 &      NA &   0.205\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 28 × 11\n",
       "\n",
       "| name &lt;chr&gt; | genus &lt;chr&gt; | vore &lt;chr&gt; | order &lt;chr&gt; | conservation &lt;chr&gt; | sleep_total &lt;dbl&gt; | sleep_rem &lt;dbl&gt; | sleep_cycle &lt;dbl&gt; | awake &lt;dbl&gt; | brainwt &lt;dbl&gt; | bodywt &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| Cheetah                        | Acinonyx     | carni | Carnivora       | lc           | 12.1 |  NA |        NA | 11.9 |      NA |  50.000 |\n",
       "| Mountain beaver                | Aplodontia   | herbi | Rodentia        | nt           | 14.4 | 2.4 |        NA |  9.6 |      NA |   1.350 |\n",
       "| Cow                            | Bos          | herbi | Artiodactyla    | domesticated |  4.0 | 0.7 | 0.6666667 | 20.0 | 0.42300 | 600.000 |\n",
       "| Dog                            | Canis        | carni | Carnivora       | domesticated | 10.1 | 2.9 | 0.3333333 | 13.9 | 0.07000 |  14.000 |\n",
       "| Roe deer                       | Capreolus    | herbi | Artiodactyla    | lc           |  3.0 |  NA |        NA | 21.0 | 0.09820 |  14.800 |\n",
       "| Goat                           | Capri        | herbi | Artiodactyla    | lc           |  5.3 | 0.6 |        NA | 18.7 | 0.11500 |  33.500 |\n",
       "| Guinea pig                     | Cavis        | herbi | Rodentia        | domesticated |  9.4 | 0.8 | 0.2166667 | 14.6 | 0.00550 |   0.728 |\n",
       "| Chinchilla                     | Chinchilla   | herbi | Rodentia        | domesticated | 12.5 | 1.5 | 0.1166667 | 11.5 | 0.00640 |   0.420 |\n",
       "| Long-nosed armadillo           | Dasypus      | carni | Cingulata       | lc           | 17.4 | 3.1 | 0.3833333 |  6.6 | 0.01080 |   3.500 |\n",
       "| Tree hyrax                     | Dendrohyrax  | herbi | Hyracoidea      | lc           |  5.3 | 0.5 |        NA | 18.7 | 0.01230 |   2.950 |\n",
       "| Horse                          | Equus        | herbi | Perissodactyla  | domesticated |  2.9 | 0.6 | 1.0000000 | 21.1 | 0.65500 | 521.000 |\n",
       "| Donkey                         | Equus        | herbi | Perissodactyla  | domesticated |  3.1 | 0.4 |        NA | 20.9 | 0.41900 | 187.000 |\n",
       "| Domestic cat                   | Felis        | carni | Carnivora       | domesticated | 12.5 | 3.2 | 0.4166667 | 11.5 | 0.02560 |   3.300 |\n",
       "| Gray seal                      | Haliochoerus | carni | Carnivora       | lc           |  6.2 | 1.5 |        NA | 17.8 | 0.32500 |  85.000 |\n",
       "| Gray hyrax                     | Heterohyrax  | herbi | Hyracoidea      | lc           |  6.3 | 0.6 |        NA | 17.7 | 0.01227 |   2.625 |\n",
       "| Thick-tailed opposum           | Lutreolina   | carni | Didelphimorphia | lc           | 19.4 | 6.6 |        NA |  4.6 |      NA |   0.370 |\n",
       "| Mongolian gerbil               | Meriones     | herbi | Rodentia        | lc           | 14.2 | 1.9 |        NA |  9.8 |      NA |   0.053 |\n",
       "| House mouse                    | Mus          | herbi | Rodentia        | nt           | 12.5 | 1.4 | 0.1833333 | 11.5 | 0.00040 |   0.022 |\n",
       "| Round-tailed muskrat           | Neofiber     | herbi | Rodentia        | nt           | 14.6 |  NA |        NA |  9.4 |      NA |   0.266 |\n",
       "| Degu                           | Octodon      | herbi | Rodentia        | lc           |  7.7 | 0.9 |        NA | 16.3 |      NA |   0.210 |\n",
       "| Northern grasshopper mouse     | Onychomys    | carni | Rodentia        | lc           | 14.5 |  NA |        NA |  9.5 |      NA |   0.028 |\n",
       "| Rabbit                         | Oryctolagus  | herbi | Lagomorpha      | domesticated |  8.4 | 0.9 | 0.4166667 | 15.6 | 0.01210 |   2.500 |\n",
       "| Sheep                          | Ovis         | herbi | Artiodactyla    | domesticated |  3.8 | 0.6 |        NA | 20.2 | 0.17500 |  55.500 |\n",
       "| Jaguar                         | Panthera     | carni | Carnivora       | nt           | 10.4 |  NA |        NA | 13.6 | 0.15700 | 100.000 |\n",
       "| Laboratory rat                 | Rattus       | herbi | Rodentia        | lc           | 13.0 | 2.4 | 0.1833333 | 11.0 | 0.00190 |   0.320 |\n",
       "| Arctic ground squirrel         | Spermophilus | herbi | Rodentia        | lc           | 16.6 |  NA |        NA |  7.4 | 0.00570 |   0.920 |\n",
       "| Thirteen-lined ground squirrel | Spermophilus | herbi | Rodentia        | lc           | 13.8 | 3.4 | 0.2166667 | 10.2 | 0.00400 |   0.101 |\n",
       "| Golden-mantled ground squirrel | Spermophilus | herbi | Rodentia        | lc           | 15.9 | 3.0 |        NA |  8.1 |      NA |   0.205 |\n",
       "\n"
      ],
      "text/plain": [
       "   name                           genus        vore  order          \n",
       "1  Cheetah                        Acinonyx     carni Carnivora      \n",
       "2  Mountain beaver                Aplodontia   herbi Rodentia       \n",
       "3  Cow                            Bos          herbi Artiodactyla   \n",
       "4  Dog                            Canis        carni Carnivora      \n",
       "5  Roe deer                       Capreolus    herbi Artiodactyla   \n",
       "6  Goat                           Capri        herbi Artiodactyla   \n",
       "7  Guinea pig                     Cavis        herbi Rodentia       \n",
       "8  Chinchilla                     Chinchilla   herbi Rodentia       \n",
       "9  Long-nosed armadillo           Dasypus      carni Cingulata      \n",
       "10 Tree hyrax                     Dendrohyrax  herbi Hyracoidea     \n",
       "11 Horse                          Equus        herbi Perissodactyla \n",
       "12 Donkey                         Equus        herbi Perissodactyla \n",
       "13 Domestic cat                   Felis        carni Carnivora      \n",
       "14 Gray seal                      Haliochoerus carni Carnivora      \n",
       "15 Gray hyrax                     Heterohyrax  herbi Hyracoidea     \n",
       "16 Thick-tailed opposum           Lutreolina   carni Didelphimorphia\n",
       "17 Mongolian gerbil               Meriones     herbi Rodentia       \n",
       "18 House mouse                    Mus          herbi Rodentia       \n",
       "19 Round-tailed muskrat           Neofiber     herbi Rodentia       \n",
       "20 Degu                           Octodon      herbi Rodentia       \n",
       "21 Northern grasshopper mouse     Onychomys    carni Rodentia       \n",
       "22 Rabbit                         Oryctolagus  herbi Lagomorpha     \n",
       "23 Sheep                          Ovis         herbi Artiodactyla   \n",
       "24 Jaguar                         Panthera     carni Carnivora      \n",
       "25 Laboratory rat                 Rattus       herbi Rodentia       \n",
       "26 Arctic ground squirrel         Spermophilus herbi Rodentia       \n",
       "27 Thirteen-lined ground squirrel Spermophilus herbi Rodentia       \n",
       "28 Golden-mantled ground squirrel Spermophilus herbi Rodentia       \n",
       "   conservation sleep_total sleep_rem sleep_cycle awake brainwt bodywt \n",
       "1  lc           12.1         NA              NA   11.9       NA  50.000\n",
       "2  nt           14.4        2.4              NA    9.6       NA   1.350\n",
       "3  domesticated  4.0        0.7       0.6666667   20.0  0.42300 600.000\n",
       "4  domesticated 10.1        2.9       0.3333333   13.9  0.07000  14.000\n",
       "5  lc            3.0         NA              NA   21.0  0.09820  14.800\n",
       "6  lc            5.3        0.6              NA   18.7  0.11500  33.500\n",
       "7  domesticated  9.4        0.8       0.2166667   14.6  0.00550   0.728\n",
       "8  domesticated 12.5        1.5       0.1166667   11.5  0.00640   0.420\n",
       "9  lc           17.4        3.1       0.3833333    6.6  0.01080   3.500\n",
       "10 lc            5.3        0.5              NA   18.7  0.01230   2.950\n",
       "11 domesticated  2.9        0.6       1.0000000   21.1  0.65500 521.000\n",
       "12 domesticated  3.1        0.4              NA   20.9  0.41900 187.000\n",
       "13 domesticated 12.5        3.2       0.4166667   11.5  0.02560   3.300\n",
       "14 lc            6.2        1.5              NA   17.8  0.32500  85.000\n",
       "15 lc            6.3        0.6              NA   17.7  0.01227   2.625\n",
       "16 lc           19.4        6.6              NA    4.6       NA   0.370\n",
       "17 lc           14.2        1.9              NA    9.8       NA   0.053\n",
       "18 nt           12.5        1.4       0.1833333   11.5  0.00040   0.022\n",
       "19 nt           14.6         NA              NA    9.4       NA   0.266\n",
       "20 lc            7.7        0.9              NA   16.3       NA   0.210\n",
       "21 lc           14.5         NA              NA    9.5       NA   0.028\n",
       "22 domesticated  8.4        0.9       0.4166667   15.6  0.01210   2.500\n",
       "23 domesticated  3.8        0.6              NA   20.2  0.17500  55.500\n",
       "24 nt           10.4         NA              NA   13.6  0.15700 100.000\n",
       "25 lc           13.0        2.4       0.1833333   11.0  0.00190   0.320\n",
       "26 lc           16.6         NA              NA    7.4  0.00570   0.920\n",
       "27 lc           13.8        3.4       0.2166667   10.2  0.00400   0.101\n",
       "28 lc           15.9        3.0              NA    8.1       NA   0.205"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# উদাহরণ ২: নির্দিষ্ট গ্রুপের প্রাণী\n",
    "carnivore_herbivores <- msleep %>%\n",
    "  filter(vore %in% c(\"carni\", \"herbi\"), \n",
    "         conservation %in% c(\"domesticated\", \"lc\", \"nt\"))\n",
    "\n",
    "carnivore_herbivores"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "aef44683",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-12-22T15:09:38.969325Z",
     "iopub.status.busy": "2025-12-22T15:09:38.967663Z",
     "iopub.status.idle": "2025-12-22T15:09:39.006922Z",
     "shell.execute_reply": "2025-12-22T15:09:39.004503Z"
    },
    "papermill": {
     "duration": 0.054961,
     "end_time": "2025-12-22T15:09:39.010087",
     "exception": false,
     "start_time": "2025-12-22T15:09:38.955126",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 2 × 6</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>name</th><th scope=col>order</th><th scope=col>vore</th><th scope=col>bodywt</th><th scope=col>sleep_total</th><th scope=col>conservation</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Dog   </td><td>Carnivora</td><td>carni</td><td>14.000</td><td>10.1</td><td>domesticated</td></tr>\n",
       "\t<tr><td>Baboon</td><td>Primates </td><td>omni </td><td>25.235</td><td> 9.4</td><td>NA          </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 2 × 6\n",
       "\\begin{tabular}{llllll}\n",
       " name & order & vore & bodywt & sleep\\_total & conservation\\\\\n",
       " <chr> & <chr> & <chr> & <dbl> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t Dog    & Carnivora & carni & 14.000 & 10.1 & domesticated\\\\\n",
       "\t Baboon & Primates  & omni  & 25.235 &  9.4 & NA          \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 2 × 6\n",
       "\n",
       "| name &lt;chr&gt; | order &lt;chr&gt; | vore &lt;chr&gt; | bodywt &lt;dbl&gt; | sleep_total &lt;dbl&gt; | conservation &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|\n",
       "| Dog    | Carnivora | carni | 14.000 | 10.1 | domesticated |\n",
       "| Baboon | Primates  | omni  | 25.235 |  9.4 | NA           |\n",
       "\n"
      ],
      "text/plain": [
       "  name   order     vore  bodywt sleep_total conservation\n",
       "1 Dog    Carnivora carni 14.000 10.1        domesticated\n",
       "2 Baboon Primates  omni  25.235  9.4        NA          "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# উদাহরণ ৩: কমপ্লেক্স ফিল্টার\n",
    "complex_filter <- msleep %>%\n",
    "  select(name, order, vore, bodywt, sleep_total, conservation) %>%\n",
    "  filter(\n",
    "    # কন্ডিশন ১: ওজন ১০-৫০ কেজি\n",
    "    between(bodywt, 10, 50),\n",
    "    # কন্ডিশন ২: ঘুম ৮-১২ ঘণ্টা\n",
    "    sleep_total >= 8 & sleep_total <= 12,\n",
    "    # কন্ডিশন ৩: conservation জানা নেই অথবা domesticated\n",
    "    is.na(conservation) | conservation == \"domesticated\"\n",
    "  )\n",
    "\n",
    "complex_filter"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "id": "66ae1d20",
   "metadata": {
    "collapsed": true,
    "execution": {
     "iopub.execute_input": "2025-12-22T15:09:39.035505Z",
     "iopub.status.busy": "2025-12-22T15:09:39.033872Z",
     "iopub.status.idle": "2025-12-22T15:09:39.074777Z",
     "shell.execute_reply": "2025-12-22T15:09:39.072211Z"
    },
    "jupyter": {
     "outputs_hidden": true
    },
    "papermill": {
     "duration": 0.056858,
     "end_time": "2025-12-22T15:09:39.078059",
     "exception": false,
     "start_time": "2025-12-22T15:09:39.021201",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "ভারী ও কম ঘুমানো প্রাণী:\n"
     ]
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "\u001b[90m# A tibble: 13 × 4\u001b[39m\n",
      "   name                 vore  bodywt sleep_total\n",
      "   \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m                \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m  \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m       \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m\n",
      "\u001b[90m 1\u001b[39m African elephant     herbi \u001b[4m6\u001b[24m654           3.3\n",
      "\u001b[90m 2\u001b[39m Asian elephant       herbi \u001b[4m2\u001b[24m547           3.9\n",
      "\u001b[90m 3\u001b[39m Giraffe              herbi  900.          1.9\n",
      "\u001b[90m 4\u001b[39m Pilot whale          carni  800           2.7\n",
      "\u001b[90m 5\u001b[39m Cow                  herbi  600           4  \n",
      "\u001b[90m 6\u001b[39m Horse                herbi  521           2.9\n",
      "\u001b[90m 7\u001b[39m Brazilian tapir      herbi  208.          4.4\n",
      "\u001b[90m 8\u001b[39m Donkey               herbi  187           3.1\n",
      "\u001b[90m 9\u001b[39m Bottle-nosed dolphin carni  173.          5.2\n",
      "\u001b[90m10\u001b[39m Caspian seal         carni   86           3.5\n",
      "\u001b[90m11\u001b[39m Gray seal            carni   85           6.2\n",
      "\u001b[90m12\u001b[39m Sheep                herbi   55.5         3.8\n",
      "\u001b[90m13\u001b[39m Common porpoise      carni   53.2         5.6\n"
     ]
    }
   ],
   "source": [
    "# ফলাফল দেখুন\n",
    "cat(\"ভারী ও কম ঘুমানো প্রাণী:\\n\")\n",
    "print(heavy_light_sleepers)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "id": "1ff83c92",
   "metadata": {
    "collapsed": true,
    "execution": {
     "iopub.execute_input": "2025-12-22T15:09:39.103638Z",
     "iopub.status.busy": "2025-12-22T15:09:39.102031Z",
     "iopub.status.idle": "2025-12-22T15:09:39.170578Z",
     "shell.execute_reply": "2025-12-22T15:09:39.168006Z"
    },
    "jupyter": {
     "outputs_hidden": true
    },
    "papermill": {
     "duration": 0.085116,
     "end_time": "2025-12-22T15:09:39.173744",
     "exception": false,
     "start_time": "2025-12-22T15:09:39.088628",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "\n",
      "কার্নিভোর ও হার্বিভোর:\n"
     ]
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "\u001b[90m# A tibble: 28 × 11\u001b[39m\n",
      "   name   genus vore  order conservation sleep_total sleep_rem sleep_cycle awake\n",
      "   \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m  \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m              \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m     \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m       \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m\n",
      "\u001b[90m 1\u001b[39m Cheet… Acin… carni Carn… lc                  12.1      \u001b[31mNA\u001b[39m        \u001b[31mNA\u001b[39m      11.9\n",
      "\u001b[90m 2\u001b[39m Mount… Aplo… herbi Rode… nt                  14.4       2.4      \u001b[31mNA\u001b[39m       9.6\n",
      "\u001b[90m 3\u001b[39m Cow    Bos   herbi Arti… domesticated         4         0.7       0.667  20  \n",
      "\u001b[90m 4\u001b[39m Dog    Canis carni Carn… domesticated        10.1       2.9       0.333  13.9\n",
      "\u001b[90m 5\u001b[39m Roe d… Capr… herbi Arti… lc                   3        \u001b[31mNA\u001b[39m        \u001b[31mNA\u001b[39m      21  \n",
      "\u001b[90m 6\u001b[39m Goat   Capri herbi Arti… lc                   5.3       0.6      \u001b[31mNA\u001b[39m      18.7\n",
      "\u001b[90m 7\u001b[39m Guine… Cavis herbi Rode… domesticated         9.4       0.8       0.217  14.6\n",
      "\u001b[90m 8\u001b[39m Chinc… Chin… herbi Rode… domesticated        12.5       1.5       0.117  11.5\n",
      "\u001b[90m 9\u001b[39m Long-… Dasy… carni Cing… lc                  17.4       3.1       0.383   6.6\n",
      "\u001b[90m10\u001b[39m Tree … Dend… herbi Hyra… lc                   5.3       0.5      \u001b[31mNA\u001b[39m      18.7\n",
      "\u001b[90m# ℹ 18 more rows\u001b[39m\n",
      "\u001b[90m# ℹ 2 more variables: brainwt <dbl>, bodywt <dbl>\u001b[39m\n"
     ]
    }
   ],
   "source": [
    "cat(\"\\nকার্নিভোর ও হার্বিভোর:\\n\")\n",
    "print(carnivore_herbivores)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "id": "a3ac79ad",
   "metadata": {
    "collapsed": true,
    "execution": {
     "iopub.execute_input": "2025-12-22T15:09:39.198681Z",
     "iopub.status.busy": "2025-12-22T15:09:39.197086Z",
     "iopub.status.idle": "2025-12-22T15:09:39.241622Z",
     "shell.execute_reply": "2025-12-22T15:09:39.239180Z"
    },
    "jupyter": {
     "outputs_hidden": true
    },
    "papermill": {
     "duration": 0.06046,
     "end_time": "2025-12-22T15:09:39.244823",
     "exception": false,
     "start_time": "2025-12-22T15:09:39.184363",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "\n",
      "কমপ্লেক্স ফিল্টার রেজাল্ট:\n"
     ]
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "\u001b[90m# A tibble: 2 × 6\u001b[39m\n",
      "  name   order     vore  bodywt sleep_total conservation\n",
      "  \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m  \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m     \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m  \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m       \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m       \n",
      "\u001b[90m1\u001b[39m Dog    Carnivora carni   14          10.1 domesticated\n",
      "\u001b[90m2\u001b[39m Baboon Primates  omni    25.2         9.4 \u001b[31mNA\u001b[39m          \n"
     ]
    }
   ],
   "source": [
    "cat(\"\\nকমপ্লেক্স ফিল্টার রেজাল্ট:\\n\")\n",
    "print(complex_filter)"
   ]
  }
 ],
 "metadata": {
  "kaggle": {
   "accelerator": "none",
   "dataSources": [],
   "dockerImageVersionId": 30749,
   "isGpuEnabled": false,
   "isInternetEnabled": true,
   "language": "r",
   "sourceType": "notebook"
  },
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.4.0"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 22.313897,
   "end_time": "2025-12-22T15:09:39.414442",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2025-12-22T15:09:17.100545",
   "version": "2.6.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}

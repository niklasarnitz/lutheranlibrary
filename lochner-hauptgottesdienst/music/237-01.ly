\version "2.24.3"
% Scan 237, printed p. 212: Besondere Präfation in der Passionszeit.
#(set-global-staff-size 16)
\header { tagline = ##f }
\paper {
  paper-width = 120\mm
  left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm
  indent = 0\mm print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}

shortBar = { \once \override Staff.BarLine.short-bar-extent = #'(0 . 2) \bar "," }
\score {
  <<
    \new Staff {
      \new Voice = "chant" {
        \clef treble \key f \major \cadenzaOn \omit Staff.TimeSignature \slurUp
        g'1 bes'1 bes'1 bes'1 bes'1 bes'1 \shortBar bes'1 a'1 g'1 a'1 a'1 a'1 a'1 \bar "|" g'1 bes'1 bes'1 bes'1 \bar "" \break
        bes'1 bes'1 bes'1 bes'1 bes'1 a'1 g'1 a'1 a'1 \bar "|" g'1 bes'1 bes'1 bes'1 \shortBar bes'1 bes'1 bes'1 bes'1 \bar "" \break
        bes'1 bes'1 bes'1 \shortBar bes'1 bes'1 bes'1 bes'1 a'1 g'1 a'1 a'1 \bar "|" g'1 bes'1 bes'1 bes'1 bes'1 bes'1 \bar "" \break
        bes'1 bes'1 bes'1 a'1 g'1 a'1 a'1 \bar "|" a'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 f'1 g'1 \bar "" \break
        a'1 g'1 g'1 \bar "|" g'1 bes'1 bes'1 bes'1 bes'1 bes'1 bes'1 bes'1 bes'1 \shortBar bes'1 bes'1 bes'1 bes'1 bes'1 \bar "" \break
        a'1 g'1 a'1 a'1 \bar "|" a'1 f'1 g'1 a'1 g'1 \bar "|" g'1 bes'1 bes'1 bes'1 bes'1 bes'1 bes'1 bes'1 \bar "" \break
        bes'1 a'1 g'1 a'1 a'1 \bar "|" g'1 bes'1 bes'1 a'1 g'1 a'1 a'1 \bar "|" a'1 f'1 g'1 a'1 g'1 \bar "" \break
        g'1 bes'1 bes'1 \shortBar bes'1 bes'1 bes'1 bes'1 bes'1 bes'1 bes'1 \shortBar bes'1 bes'1 bes'1 a'1 g'1 a'1 a'1 a'1 \bar "" \break
        a'1 a'1 bes'1 a'1 a'1 \shortBar f'1 g'1 a'1 g'1 \bar "|" g'1 bes'1 bes'1 bes'1 bes'1 bes'1 bes'1 \bar "" \break
        bes'1 bes'1 bes'1 a'1 g'1 a'1 a'1 \bar "|" a'1 a'1 bes'1 a'1 f'1 g'1 a'1 g'1 \bar "|."
      }
    }
    \new Lyrics \lyricsto "chant" {
      \set ignoreMelismata = ##t
      "Wahr-" "haft" "wür :" "dig" "und" "recht," "bil :" "lig" "und" "heil :" "sam" "ist" "es," "daß" "wir" "dir" "ü :"
      "ber :" "all" "und" "al :" "le :" "zeit" "dank :" "sa :" "gen," "der" "du" "das" "Heil" "des" "mensch :" "li :" "chen"
      "Ge :" "schlech :" "tes" "am" "Stamm" "des" "Kreu :" "zes" "voll :" "bracht" "hast," "auf" "daß" "vom" "Hol :" "ze" "das"
      "Le :" "ben" "wie :" "der" "ent :" "sprös :" "se," "wie" "der" "Tod" "vom" "Hol :" "ze" "den" "An :" "fang" "ge :"
      "nom :" "men" "hat," "und" "der" "am" "Holz" "den" "Sieg" "ge :" "won :" "nen," "ihn" "am" "Hol :" "ze" "wie :"
      "der" "ver :" "lö :" "re" "durch" "JE :" "sum" "Chri :" "stum," "durch" "wel :" "chen" "dei :" "ne" "Ma :" "je :" "stät"
      "lo :" "ben" "die" "En :" "gel," "an :" "be :" "ten" "die" "Herr :" "schaf :" "ten," "fürch :" "ten" "die" "Mäch :" "te,"
      "die" "Him :" "mel" "und" "al :" "ler" "Him :" "mel" "Kräf :" "te" "sammt" "den" "se :" "li :" "gen" "Se :" "ra :" "phim"
      "mit" "ein :" "hel :" "li :" "gem" "Ju :" "bel" "prei :" "sen." "Mit" "ih :" "nen" "laß" "auch" "un :" "se :"
      "re" "Stim :" "men" "uns" "ver :" "ei :" "nen" "und" "an :" "be :" "tend" "zu" "dir" "spre :" "chen:"
    }
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-3 }
  }
}

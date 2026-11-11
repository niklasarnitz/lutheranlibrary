\version "2.24.3"
% Scan 240, printed p. 215: Besondere Präfation am Pfingstfeste, Schluß.
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
        bes'1 bes'1 bes'1 a'1 g'1 a'1 a'1 \bar "|" a'1 a'1 a'1 f'1 g'1 a'1 g'1 \bar "|" g'1 bes'1 \bar "" \break
        bes'1 bes'1 bes'1 bes'1 bes'1 \shortBar bes'1 bes'1 bes'1 bes'1 bes'1 bes'1 \bar "|" bes'1 bes'1 bes'1 bes'1 bes'1 bes'1 \bar "" \break
        bes'1 a'1 g'1 a'1 a'1 \bar "|" g'1 a'1 a'1 a'1 a'1 \shortBar a'1 a'1 a'1 a'1 bes'1 a'1 a'1 \bar "" \break
        a'1 a'1 a'1 a'1 a'1 a'1 bes'1 a'1 a'1 a'1 a'1 f'1 g'1 a'1 g'1 \bar "" \break
        g'1 bes'1 bes'1 bes'1 a'1 g'1 a'1 a'1 \bar "|" g'1 bes'1 a'1 a'1 f'1 g'1 a'1 g'1 \bar "" \break
        g'1 bes'1 bes'1 bes'1 bes'1 bes'1 bes'1 \bar "|" bes'1 bes'1 a'1 g'1 a'1 a'1 \bar "|" g'1 bes'1 bes'1 \bar "" \break
        bes'1 bes'1 bes'1 bes'1 a'1 g'1 a'1 a'1 a'1 \bar "|" a'1 a'1 f'1 g'1 a'1 g'1 \bar "|."
      }
    }
    \new Lyrics \lyricsto "chant" {
      \set ignoreMelismata = ##t
      "al :" "lent :" "hal :" "ben" "dank :" "sa :" "gen" "durch" "Chri :" "stum," "un :" "sern" "HEr :" "ren." "Denn" "er"
      "ist" "auf :" "ge :" "fah :" "ren" "ü :" "ber" "al :" "le" "Him :" "mel" "und" "hat" "sich" "ge :" "se :" "tzet"
      "zu" "dei :" "ner" "Rech :" "ten" "und" "aus :" "ge :" "gos :" "sen," "wie" "es" "heut" "am" "Ta :" "ge" "ist,"
      "den" "ver :" "hei :" "ße :" "nen" "Geist" "ü :" "ber" "die" "aus :" "er :" "wähl :" "ten" "Kin :" "der."
      "Des" "freu :" "et" "sich" "und" "froh :" "lo :" "cket" "der" "Erd :" "kreis" "mit" "lau :" "tem" "Schal :" "le,"
      "und" "die" "o :" "be :" "ren" "Kräf :" "te" "und" "himm :" "li :" "schen" "Mäch :" "te" "sin :" "gen" "dei :"
      "ner" "Herr :" "lich :" "keit" "ei :" "nen" "Lob :" "ge :" "sang" "und" "spre :" "chen" "ohn" "En :" "de:"
    }
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-3 }
  }
}
